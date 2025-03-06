import 'package:cron/cron.dart';
import 'package:crpto/features/coins_exchange/application/use_case/get_coins_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange_list/coin_exchange_list_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_exchange_list_controller.g.dart';

final Schedule _everyFiveMinutesSchedule = Schedule.parse('*/5 * * * *');

@Riverpod(keepAlive: true)
class CoinExchangeListController extends _$CoinExchangeListController {
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
      loadCoinsExchangeStats,
    );

    ref.onDispose(() => loadCoinsExchangeStatsScheduledTask.cancel());

    _listenSelectedCoins().listen((_) => loadCoinsExchangeStats());

    return const CoinExchangeListState.initial();
  }

  Future<void> loadCoinsExchangeStats() async {
    final selectedCoins = _getSelectedCoins();

    state = const AsyncLoading();

    if (selectedCoins.isNotEmpty) {
      final symbols =
          selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

      final coinsExchangeStats = await _getCoinsExchangeStats(symbols);

      state = AsyncData(CoinExchangeListState.data(coinsExchangeStats));
    } else {
      state = const AsyncData(CoinExchangeListState.empty());
    }
  }
}
