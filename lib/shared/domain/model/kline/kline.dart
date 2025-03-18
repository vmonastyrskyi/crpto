import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/kline.freezed.dart';

@freezed
class Kline with _$Kline {
  const Kline({
    required this.openTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.closeTime,
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
}
