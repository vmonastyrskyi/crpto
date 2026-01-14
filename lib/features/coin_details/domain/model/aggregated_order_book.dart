import 'package:crpto/features/coin_details/domain/model/order_book_level_depth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/aggregated_order_book.freezed.dart';

@freezed
class AggregatedOrderBook with _$AggregatedOrderBook {
  const AggregatedOrderBook({required this.bids, required this.asks});

  @override
  final List<OrderBookLevelDepth> bids;
  @override
  final List<OrderBookLevelDepth> asks;
}
