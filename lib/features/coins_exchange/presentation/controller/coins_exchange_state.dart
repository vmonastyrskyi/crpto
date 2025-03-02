import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coins_exchange_state.freezed.dart';

enum CoinsExchangeStatus { initial, loading, loaded, error }

@freezed
class CoinsExchangeState with _$CoinsExchangeState {
  const CoinsExchangeState._({
    required this.status,
    required this.coinsExchangeStats,
  });

  const CoinsExchangeState.initial()
    : this._(status: CoinsExchangeStatus.initial, coinsExchangeStats: const []);

  @override
  final CoinsExchangeStatus status;
  @override
  final List<CoinExchangeStats> coinsExchangeStats;
}
