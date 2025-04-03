import 'dart:async';

import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/features/coins_exchange/application/use_case/get_recent_trades.dart';
import 'package:crpto/features/coins_exchange/application/use_case/listen_recent_trades.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/recent_trades_notifier.g.dart';

@Riverpod(keepAlive: true)
class RecentTradesNotifier extends _$RecentTradesNotifier {
  final Debounce _loadRecentTradesDebounce = Debounce();

  StreamSubscription<RecentTrade>? _recentTradesStreamSubscription;
  Map<String, RecentTrade> _currentRecentTrades = {};
  List<SelectedCoin> _previousSelectedCoins = [];

  late GetSelectedCoinsUseCase _getSelectedCoins;
  late ListenSelectedCoinsUseCase _listenSelectedCoins;
  late GetRecentTradesUseCase _getRecentTrades;
  late ListenRecentTradesUseCase _listenRecentTrades;

  @override
  Future<Map<String, RecentTrade>> build() async {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getRecentTrades = await ref.watch(getRecentTradesUseCaseProvider);
    _listenRecentTrades = await ref.watch(listenRecentTradesUseCaseProvider);

    ref.onDispose(() => _loadRecentTradesDebounce.cancel());
    ref.onDispose(() => _recentTradesStreamSubscription?.cancel());

    await _loadRecentTrades();

    _listenSelectedCoins(getOnWatch: true).listen((selectedCoins) {
      _loadRecentTradesDebounce(() async {
        await _recentTradesStreamSubscription?.cancel();

        final selectedSymbols = <String>[
          ...selectedCoins.map((selectedCoin) => selectedCoin.symbol),
        ];
        final previousSelectedSymbols = <String>[
          ..._previousSelectedCoins.map((selectedCoin) => selectedCoin.symbol),
        ];

        final symbolsToAdd = <String>[
          ...{...selectedSymbols}.difference({...previousSelectedSymbols}),
        ];
        final symbolsToRemove = <String>[
          ...{...previousSelectedSymbols}.difference({...selectedSymbols}),
        ];

        if (symbolsToRemove.isNotEmpty) {
          for (final symbol in symbolsToRemove) {
            _currentRecentTrades.remove(symbol);
          }

          state = AsyncData({..._currentRecentTrades});
        }

        for (final symbolToAdd in symbolsToAdd) {
          final recentTrades = await _getRecentTrades(symbolToAdd);

          if (recentTrades.isNotEmpty) {
            _currentRecentTrades[symbolToAdd] = recentTrades[0];

            state = AsyncData({..._currentRecentTrades});
          }
        }

        _recentTradesStreamSubscription = _listenRecentTrades(
          selectedSymbols,
        ).listen((recentTrade) {
          if (selectedSymbols.contains(recentTrade.symbol)) {
            _currentRecentTrades[recentTrade.symbol] = recentTrade;

            state = AsyncData({..._currentRecentTrades});
          }
        });

        _previousSelectedCoins = selectedCoins;
      }, const Duration(milliseconds: 250));
    });

    return await future;
  }

  Future<void> _loadRecentTrades([
    List<SelectedCoin>? optionalSelectedCoins,
  ]) async {
    final selectedCoins =
        _previousSelectedCoins =
            optionalSelectedCoins != null && optionalSelectedCoins.isNotEmpty
                ? optionalSelectedCoins
                : _getSelectedCoins();

    if (selectedCoins.isNotEmpty) {
      final symbols = <String>[
        ...selectedCoins.map((selectedCoin) => selectedCoin.symbol),
      ];

      for (final symbol in symbols) {
        final recentTrades = await _getRecentTrades(symbol);

        if (recentTrades.isNotEmpty) {
          _currentRecentTrades[symbol] = recentTrades[0];
        }
      }

      state = AsyncData(_currentRecentTrades);
    } else {
      state = const AsyncData({});

      _currentRecentTrades = {};
    }
  }
}
