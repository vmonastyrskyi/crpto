import 'dart:async';

import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/features/coins_exchange/application/use_case/listen_recent_trades.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_list/recent_trade_list_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/recent_trade_list_controller.g.dart';

@riverpod
class RecentTradeListController extends _$RecentTradeListController {
  final Debounce _listenRecentTradesDebounce = Debounce();
  final StreamController<RecentTradeListState> _streamController =
      StreamController();

  late final ListenRecentTradesUseCase _listenRecentTrades;
  late final ListenSelectedCoinsUseCase _listenSelectedCoins;

  StreamSubscription<RecentTrade>? _recentTradesStreamSubscription;
  List<SelectedCoin> _previousSelectedCoins = [];

  @override
  Stream<RecentTradeListState> build() async* {
    yield const RecentTradeListState.initial();

    _listenRecentTrades = await ref.watch(listenRecentTradesUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);

    ref.onDispose(() => _listenRecentTradesDebounce.cancel());

    ref.onDispose(() => _recentTradesStreamSubscription?.cancel());

    ref.onDispose(() => _streamController.close());

    _listenSelectedCoins(getOnWatch: true).listen((selectedCoins) {
      _listenRecentTradesDebounce(() {
        state.whenData((data) {
          _recentTradesStreamSubscription?.cancel();

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

          final recentTrades = {...data.recentTrades};

          for (final symbolToRemove in symbolsToRemove) {
            recentTrades.remove(symbolToRemove);
          }

          _streamController.add(
            RecentTradeListState.data(recentTrades: recentTrades),
          );

          final symbols =
              selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

          _recentTradesStreamSubscription = _listenRecentTrades(symbols).listen(
            (recentTrade) {
              state.whenData((data) {
                if (selectedSymbols.contains(recentTrade.symbol)) {
                  final recentTrades = {...data.recentTrades};

                  recentTrades[recentTrade.symbol] = recentTrade;

                  _streamController.add(
                    RecentTradeListState.data(recentTrades: recentTrades),
                  );
                }
              });
            },
          );

          _previousSelectedCoins = selectedCoins;
        });
      }, const Duration(milliseconds: 250));
    });

    yield* _streamController.stream;
  }
}
