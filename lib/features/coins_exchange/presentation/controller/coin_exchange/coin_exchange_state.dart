import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_state.freezed.dart';

@freezed
class CoinExchangeState with _$CoinExchangeState {
  const factory CoinExchangeState({
    required CoinExchangeStats exchangeStats,
    required CoinMetadata metadata,
  }) = _CoinExchangeState;

  factory CoinExchangeState.initial({
    required CoinExchangeStats exchangeStats,
    required CoinMetadata metadata,
  }) => CoinExchangeState(
    exchangeStats: exchangeStats,
    metadata: metadata,
  );
}
