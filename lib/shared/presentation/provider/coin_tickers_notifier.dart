import 'dart:async';

import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/shared/application/use_case/coin_ticker/get_coin_ticker.dart';
import 'package:crpto/shared/application/use_case/coin_ticker/listen_coin_tickers.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'generated/coin_tickers_notifier.g.dart';

@Riverpod(keepAlive: true)
class CoinTickersNotifier extends _$CoinTickersNotifier {
  final Debounce _loadCoinTickersDebounce = Debounce();
  final BehaviorSubject<Map<String, CoinTicker>> _coinTickersStreamController =
      BehaviorSubject();

  StreamSubscription<CoinTicker>? _coinTickersStreamSubscription;
  Map<String, CoinTicker> _currentCoinTickers = {};
  List<SelectedCoin> _previousSelectedCoins = [];

  late GetSelectedCoinsUseCase _getSelectedCoins;
  late ListenSelectedCoinsUseCase _listenSelectedCoins;
  late GetCoinTickerUseCase _getCoinTicker;
  late ListenCoinTickersUseCase _listenCoinTickers;

  @override
  Future<Map<String, CoinTicker>> build() async {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getCoinTicker = await ref.watch(getCoinTickerUseCaseProvider);
    _listenCoinTickers = await ref.watch(listenCoinTickersUseCaseProvider);

    ref.onDispose(() => _loadCoinTickersDebounce.cancel());
    ref.onDispose(() => _coinTickersStreamSubscription?.cancel());
    ref.onDispose(() => _coinTickersStreamController.close());

    await _loadCoinTickers();

    _listenSelectedCoins(getOnWatch: true).listen((selectedCoins) {
      _loadCoinTickersDebounce(() async {
        await _coinTickersStreamSubscription?.cancel();

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
            _currentCoinTickers.remove(symbol);
          }

          state = AsyncData(_currentCoinTickers);
        }

        for (final symbolToAdd in symbolsToAdd) {
          final coinTicker = await _getCoinTicker(symbolToAdd);

          _currentCoinTickers[symbolToAdd] = coinTicker;

          state = AsyncData(_currentCoinTickers);
        }

        _coinTickersStreamSubscription = _listenCoinTickers(
          selectedSymbols,
        ).listen((coinTicker) {
          if (selectedSymbols.contains(coinTicker.symbol)) {
            _currentCoinTickers[coinTicker.symbol] = coinTicker;
          }

          _coinTickersStreamController.add(_currentCoinTickers);
        });

        _previousSelectedCoins = selectedCoins;
      }, const Duration(milliseconds: 250));
    });

    _coinTickersStreamController
        .throttleTime(const Duration(seconds: 5))
        .listen((coinTickers) => state = AsyncData(coinTickers));

    return await future;
  }

  Future<void> _loadCoinTickers([
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
        final coinTicker = await _getCoinTicker(symbol);

        _currentCoinTickers[symbol] = coinTicker;
      }

      state = AsyncData(_currentCoinTickers);
    } else {
      state = const AsyncData({});

      _currentCoinTickers = {};
    }
  }
}
