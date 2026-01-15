import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_book_level.freezed.dart';

@freezed
class OrderBookLevel with _$OrderBookLevel {
  const OrderBookLevel({required this.price, required this.quantity});

  @override
  final double price;
  @override
  final double quantity;
}
