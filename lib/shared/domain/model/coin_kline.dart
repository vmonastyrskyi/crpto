import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_kline.freezed.dart';

@freezed
class CoinKline with _$CoinKline {
  const CoinKline({
    required this.openTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.closeTime,
    required this.volume,
    required this.quoteVolume,
    required this.count,
  });

  @override
  final DateTime openTime;
  @override
  final double openPrice;
  @override
  final double highPrice;
  @override
  final double lowPrice;
  @override
  final double closePrice;
  @override
  final DateTime closeTime;
  @override
  final double volume;
  @override
  final double quoteVolume;
  @override
  final int count;
}
