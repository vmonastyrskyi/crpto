import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_stats.freezed.dart';

@freezed
class CoinExchangeStats with _$CoinExchangeStats {
  factory CoinExchangeStats({
    required String symbol,
    required double priceChange,
    required double priceChangePercent,
    required double lastPrice,
    required double openPrice,
    required double highPrice,
    required double lowPrice,
    required double volume,
    required double quoteVolume,
  }) = _CoinExchangeStats;
}
