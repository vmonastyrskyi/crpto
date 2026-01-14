import 'package:crpto/features/coin_details/domain/model/order_book_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_book.freezed.dart';

@freezed
class OrderBook with _$OrderBook {
  const OrderBook({
    required this.bids,
    required this.asks,
    this.firstUpdateId,
    required this.lastUpdateId,
  });

  @override
  final List<OrderBookLevel> bids;
  @override
  final List<OrderBookLevel> asks;
  @override
  final int? firstUpdateId;
  @override
  final int lastUpdateId;
}
