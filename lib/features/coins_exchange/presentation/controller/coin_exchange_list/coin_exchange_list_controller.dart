import 'dart:async';

import 'package:cron/cron.dart';
import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/features/coins_exchange/application/use_case/get_coins_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange_list/coin_exchange_list_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_exchange_list_controller.g.dart';

final Schedule _everyFiveMinutesSchedule = Schedule.parse('*/5 * * * *');

@Riverpod(keepAlive: true)
class CoinExchangeListController extends _$CoinExchangeListController {
  final Debounce _loadCoinsExchangeStatsDebounce = Debounce();

  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final ListenSelectedCoinsUseCase _listenSelectedCoins;
  late final GetCoinsExchangeStatsUseCase _getCoinsExchangeStats;

  @override
  FutureOr<CoinExchangeListState> build() {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getCoinsExchangeStats = ref.watch(getCoinsExchangeStatsUseCaseProvider);

    final loadCoinsExchangeStatsScheduledTask = Cron().schedule(
      _everyFiveMinutesSchedule,
      refreshCoinsExchangeStats,
    );

    ref.onDispose(() => loadCoinsExchangeStatsScheduledTask.cancel());

    _listenSelectedCoins().listen(
      (selectedCoins) => _loadCoinsExchangeStats(
        optionalSelectedCoins: selectedCoins,
        debounce: true,
      ),
    );

    return const CoinExchangeListState.initial();
  }

  Future<void> refreshCoinsExchangeStats() =>
      _loadCoinsExchangeStats(debounce: false);

  Future<void> _loadCoinsExchangeStats({
    List<SelectedCoin>? optionalSelectedCoins,
    bool debounce = false,
  }) {
    final completer = Completer<void>();

    _loadCoinsExchangeStatsDebounce(() async {
      final selectedCoins =
          optionalSelectedCoins != null && optionalSelectedCoins.isNotEmpty
              ? optionalSelectedCoins
              : _getSelectedCoins();

      state = const AsyncLoading();

      if (selectedCoins.isNotEmpty) {
        final symbols =
            selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

        final coinsExchangeStats = await _getCoinsExchangeStats(symbols);

        state = AsyncData(CoinExchangeListState.data(coinsExchangeStats));
      } else {
        state = const AsyncData(CoinExchangeListState.data([]));
      }

      completer.complete();
    }, debounce ? const Duration(milliseconds: 250) : Duration.zero);

    return completer.future;
  }
}
