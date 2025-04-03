import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_ticker.freezed.dart';

@freezed
class CoinTicker with _$CoinTicker {
  const CoinTicker({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.lastPrice,
    required this.volume,
    required this.quoteVolume,
    required this.count,
  });

  @override
  final String symbol;
  @override
  final double priceChange;
  @override
  final double priceChangePercent;
  @override
  final double openPrice;
  @override
  final double highPrice;
  @override
  final double lowPrice;
  @override
  final double lastPrice;
  @override
  final double volume;
  @override
  final double quoteVolume;
  @override
  final int count;
}
