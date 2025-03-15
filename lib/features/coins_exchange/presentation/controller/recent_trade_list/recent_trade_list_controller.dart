import 'dart:async';

import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/features/coins_exchange/application/use_case/get_recent_trades.dart';
import 'package:crpto/features/coins_exchange/application/use_case/listen_recent_trades.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_list/recent_trade_list_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/recent_trade_list_controller.g.dart';

@Riverpod(keepAlive: true)
class RecentTradeListController extends _$RecentTradeListController {
  final Debounce _listenRecentTradesDebounce = Debounce();

  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final ListenSelectedCoinsUseCase _listenSelectedCoins;
  late final GetRecentTradesUseCase _getRecentTrades;
  late final ListenRecentTradesUseCase _listenRecentTrades;

  StreamSubscription<RecentTrade>? _recentTradesStreamSubscription;
  Map<String, RecentTrade> _currentRecentTrades = {};
  List<SelectedCoin> _previousSelectedCoins = [];

  @override
  Future<RecentTradeListState> build() async {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getRecentTrades = await ref.watch(getRecentTradesUseCaseProvider);
    _listenRecentTrades = await ref.watch(listenRecentTradesUseCaseProvider);

    ref.onDispose(() => _listenRecentTradesDebounce.cancel());
    ref.onDispose(() => _recentTradesStreamSubscription?.cancel());

    await _loadRecentTrades();

    _listenSelectedCoins(getOnWatch: true).listen((selectedCoins) {
      _listenRecentTradesDebounce(() async {
        await _recentTradesStreamSubscription?.cancel();

        final selectedSymbols = [
          ...selectedCoins.map((selectedCoin) => selectedCoin.symbol),
        ];
        final previousSelectedSymbols = [
          ..._previousSelectedCoins.map((selectedCoin) => selectedCoin.symbol),
        ];

        final symbolsToAdd = [
          ...{...selectedSymbols}.difference({...previousSelectedSymbols}),
        ];

        final symbolsToRemove = [
          ...{...previousSelectedSymbols}.difference({...selectedSymbols}),
        ];

        if (symbolsToRemove.isNotEmpty) {
          for (final symbol in symbolsToRemove) {
            _currentRecentTrades.remove(symbol);
          }

          state = AsyncData(
            RecentTradeListState.data(recentTrades: {..._currentRecentTrades}),
          );
        }

        for (final symbolToAdd in symbolsToAdd) {
          final recentTrades = await _getRecentTrades(symbolToAdd);

          if (recentTrades.isNotEmpty) {
            _currentRecentTrades[symbolToAdd] = recentTrades[0];

            state = AsyncData(
              RecentTradeListState.data(
                recentTrades: {..._currentRecentTrades},
              ),
            );
          }
        }

        _recentTradesStreamSubscription = _listenRecentTrades(
          selectedSymbols,
        ).listen((recentTrade) {
          if (selectedSymbols.contains(recentTrade.symbol)) {
            _currentRecentTrades[recentTrade.symbol] = recentTrade;

            state = AsyncData(
              RecentTradeListState.data(
                recentTrades: {..._currentRecentTrades},
              ),
            );
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
      final symbols = [
        ...selectedCoins.map((selectedCoin) => selectedCoin.symbol),
      ];

      for (final symbol in symbols) {
        final recentTrades = await _getRecentTrades(symbol);

        if (recentTrades.isNotEmpty) {
          _currentRecentTrades[symbol] = recentTrades[0];
        }
      }

      state = AsyncData(
        RecentTradeListState.data(recentTrades: _currentRecentTrades),
      );
    } else {
      state = const AsyncData(RecentTradeListState.empty());

      _currentRecentTrades = {};
    }
  }
}
