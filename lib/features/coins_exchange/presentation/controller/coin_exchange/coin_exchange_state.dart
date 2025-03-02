import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_state.freezed.dart';

@freezed
class CoinExchangeState with _$CoinExchangeState {
  const CoinExchangeState._({
    required this.exchangeStats,
    required this.metadata,
  });

  const CoinExchangeState.initial({
    required CoinExchangeStats exchangeStats,
    required CoinMetadata metadata,
  }) : this._(exchangeStats: exchangeStats, metadata: metadata);

  @override
  final CoinExchangeStats exchangeStats;
  @override
  final CoinMetadata metadata;
}
