import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_stats.freezed.dart';

@freezed
class CoinExchangeStats with _$CoinExchangeStats {
  const CoinExchangeStats({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.lastPrice,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
  });

  @override
  final String symbol;
  @override
  final double priceChange;
  @override
  final double priceChangePercent;
  @override
  final double lastPrice;
  @override
  final double openPrice;
  @override
  final double highPrice;
  @override
  final double lowPrice;
  @override
  final double volume;
  @override
  final double quoteVolume;
}
