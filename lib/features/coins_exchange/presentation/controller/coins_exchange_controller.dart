import 'package:crpto/features/coins_exchange/application/use_case/get_coins_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coins_exchange_controller.g.dart';

extension CoinsExchangeControllerExtension on WidgetRef {
  CoinsExchangeController coinsExchangeController() =>
      read(coinsExchangeControllerProvider.notifier);
}

@Riverpod(keepAlive: true)
class CoinsExchangeController extends _$CoinsExchangeController {
  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final GetCoinsExchangeStatsUseCase _getCoinsExchangeStats;

  @override
  CoinsExchangeState build() {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _getCoinsExchangeStats = ref.watch(getCoinsExchangeStatsUseCaseProvider);

    return CoinsExchangeState.initial();
  }

  List<CoinExchangeStats> _lastCoinsExchangeStats = const [];

  Future<void> loadCoinsExchangeStats() async {
    state = state.copyWith(status: CoinsExchangeStatus.loading);

    final selectedCoins = _getSelectedCoins();

    final symbols =
        selectedCoins.map((selectedCoin) => selectedCoin.symbol).toList();

    final coinsExchangeStats =
        _lastCoinsExchangeStats = await _getCoinsExchangeStats(symbols);

    state = state.copyWith(
      status: CoinsExchangeStatus.loaded,
      coinsExchangeStats: coinsExchangeStats,
    );
  }
}
