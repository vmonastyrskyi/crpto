import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coins_exchange_state.freezed.dart';

enum CoinsExchangeStatus { initial, loading, loaded, error }

@freezed
class CoinsExchangeState with _$CoinsExchangeState {
  const factory CoinsExchangeState({
    required CoinsExchangeStatus status,
    required List<CoinExchangeStats> coinsExchangeStats,
  }) = _CoinsExchangeState;

  factory CoinsExchangeState.initial() => const CoinsExchangeState(
    status: CoinsExchangeStatus.initial,
    coinsExchangeStats: [],
  );
}
