import 'package:crpto/shared/domain/model/enum/trade_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade.freezed.dart';

@freezed
class RecentTrade with _$RecentTrade {
  const RecentTrade({
    required this.id,
    required this.symbol,
    required this.price,
    required this.quantity,
    required this.type,
  });

  @override
  final int id;
  @override
  final String symbol;
  @override
  final double price;
  @override
  final double quantity;
  @override
  final TradeType type;
}
