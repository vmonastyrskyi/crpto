import 'package:crpto/features/coin_details/domain/model/order_book_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_book_level_depth.freezed.dart';

@freezed
class OrderBookLevelDepth with _$OrderBookLevelDepth {
  OrderBookLevelDepth({required this.level, required this.depth});

  @override
  final OrderBookLevel level;
  @override
  final double depth;
}
