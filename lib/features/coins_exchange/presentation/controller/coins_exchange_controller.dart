import 'package:crpto/features/coins_exchange/application/use_case/get_coins_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/listen_selected_coins.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coins_exchange_controller.g.dart';

@Riverpod(keepAlive: true)
class CoinsExchangeController extends _$CoinsExchangeController {
  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final ListenSelectedCoinsUseCase _listenSelectedCoins;
  late final GetCoinsExchangeStatsUseCase _getCoinsExchangeStats;

  @override
  CoinsExchangeState build() {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _listenSelectedCoins = ref.watch(listenSelectedCoinsUseCaseProvider);
    _getCoinsExchangeStats = ref.watch(getCoinsExchangeStatsUseCaseProvider);

    _listenSelectedCoins().listen((_) => loadCoinsExchangeStats());

    return CoinsExchangeState.initial();
  }

  Future<void> loadCoinsExchangeStats() async {
    final selectedCoins = _getSelectedCoins();

    if (selectedCoins.isNotEmpty) {
      state = state.copyWith(status: CoinsExchangeStatus.loading);

      final symbols =
          selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

      final coinsExchangeStats = await _getCoinsExchangeStats(symbols);

      state = state.copyWith(
        status: CoinsExchangeStatus.loaded,
        coinsExchangeStats: coinsExchangeStats,
      );
    } else {
      state = state.copyWith(
        status: CoinsExchangeStatus.loaded,
        coinsExchangeStats: const [],
      );
    }
  }
}
