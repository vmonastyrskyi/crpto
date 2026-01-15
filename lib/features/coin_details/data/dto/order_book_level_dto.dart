import 'package:crpto/features/coin_details/domain/model/order_book_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_book_level_dto.freezed.dart';

@freezed
@JsonSerializable(createFactory: false, createToJson: false)
class OrderBookLevelDTO with _$OrderBookLevelDTO {
  const OrderBookLevelDTO({required this.price, required this.quantity});

  @override
  final double price;
  @override
  final double quantity;

  factory OrderBookLevelDTO.fromJson(List<dynamic> json) {
    return OrderBookLevelDTO(
      price: double.parse(json[0] as String),
      quantity: double.parse(json[1] as String),
    );
  }
}

extension OrderBookLevelDTOMapper on OrderBookLevelDTO {
  static OrderBookLevel toModel(OrderBookLevelDTO dto) {
    return OrderBookLevel(price: dto.price, quantity: dto.quantity);
  }
}
