import 'dart:async';

import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_list/coin_ticker_list_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/application/use_case/ticker/get_coin_tickers.dart';
import 'package:crpto/shared/application/use_case/ticker/listen_coin_tickers.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_ticker_list_controller.g.dart';

@Riverpod(keepAlive: true)
class CoinTickerListController extends _$CoinTickerListController {
  final Debounce _loadCoinTickersDebounce = Debounce();
  final StreamController<CoinTickerListState> _streamController =
      StreamController();

  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final ListenSelectedCoinsUseCase _listenSelectedCoins;
  late final GetCoinTickersUseCase _getCoinTickers;
  late final ListenCoinTickersUseCase _listenCoinTickers;

  StreamSubscription<CoinTicker>? _coinTickersStreamSubscription;
  List<SelectedCoin> _previousSelectedCoins = [];

  @override
  Stream<CoinTickerListState> build() async* {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getCoinTickers = await ref.watch(getCoinTickersUseCaseProvider);
    _listenCoinTickers = await ref.watch(listenCoinTickersUseCaseProvider);

    ref.onDispose(() => _loadCoinTickersDebounce.cancel());

    ref.onDispose(() => _coinTickersStreamSubscription?.cancel());

    ref.onDispose(() => _streamController.close());

    yield await _loadCoinTickers();

    _listenSelectedCoins(getOnWatch: true).listen((selectedCoins) {
      _loadCoinTickersDebounce(() async {
        await _loadCoinTickers(selectedCoins);

        state.whenData((data) {
          _coinTickersStreamSubscription?.cancel();

          final selectedSymbols =
              selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();
          final previousSelectedSymbols =
              _previousSelectedCoins
                  .map((selectedCoin) => selectedCoin.symbol)
                  .toList();

          final symbolsToRemove =
              previousSelectedSymbols
                  .toSet()
                  .difference(selectedSymbols.toSet())
                  .toList();

          final tickers = {...data.tickers};

          for (final symbolToRemove in symbolsToRemove) {
            tickers.remove(symbolToRemove);
          }

          _streamController.add(CoinTickerListState.data(tickers: tickers));

          final symbols =
              selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

          _coinTickersStreamSubscription = _listenCoinTickers(symbols).listen((
            ticker,
          ) {
            state.whenData((data) {
              if (selectedSymbols.contains(ticker.symbol)) {
                final tickers = {...data.tickers};

                tickers[ticker.symbol] = ticker;

                _streamController.add(
                  CoinTickerListState.data(tickers: tickers),
                );
              }
            });
          });

          _previousSelectedCoins = selectedCoins;
        });
      }, const Duration(milliseconds: 250));
    });

    yield* _streamController.stream;
  }

  Future<CoinTickerListState> _loadCoinTickers([
    List<SelectedCoin>? optionalSelectedCoins,
  ]) async {
    final selectedCoins =
        optionalSelectedCoins != null && optionalSelectedCoins.isNotEmpty
            ? optionalSelectedCoins
            : _getSelectedCoins();

    state = const AsyncLoading();

    if (selectedCoins.isNotEmpty) {
      final symbols =
          selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

      final coinTickers = await _getCoinTickers(symbols);

      final tickers = {
        for (final coinTicker in coinTickers) coinTicker.symbol: coinTicker,
      };

      state = AsyncData(CoinTickerListState.data(tickers: tickers));
    } else {
      state = const AsyncData(CoinTickerListState.empty());
    }

    return await future;
  }
}
