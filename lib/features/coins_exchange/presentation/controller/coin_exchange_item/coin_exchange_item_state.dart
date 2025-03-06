import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_item_state.freezed.dart';

@freezed
class CoinExchangeItemState with _$CoinExchangeItemState {
  const CoinExchangeItemState._({
    required this.coinExchangeStats,
    required this.metadata,
  });

  const CoinExchangeItemState.initial({
    required CoinExchangeStats coinExchangeStats,
    required CoinMetadata metadata,
  }) : this._(coinExchangeStats: coinExchangeStats, metadata: metadata);

  @override
  final CoinExchangeStats coinExchangeStats;
  @override
  final CoinMetadata metadata;
}
