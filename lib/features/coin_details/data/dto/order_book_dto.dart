import 'package:crpto/features/coin_details/data/dto/order_book_level_dto.dart';
import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_book_dto.freezed.dart';

@freezed
@JsonSerializable(createFactory: false, createToJson: false)
class OrderBookDTO with _$OrderBookDTO {
  const OrderBookDTO({
    required this.bids,
    required this.asks,
    this.firstUpdateId,
    required this.lastUpdateId,
  });

  @override
  final List<OrderBookLevelDTO> bids;
  @override
  final List<OrderBookLevelDTO> asks;
  @override
  final int? firstUpdateId;
  @override
  final int lastUpdateId;

  factory OrderBookDTO.fromJson(Map<String, dynamic> json) {
    return OrderBookDTO(
      bids: ((json['bids'] ??= json['b']) as List<dynamic>)
          .map((e) => OrderBookLevelDTO.fromJson(e as List<dynamic>))
          .toList(),
      asks: ((json['asks'] ??= json['a']) as List<dynamic>)
          .map((e) => OrderBookLevelDTO.fromJson(e as List<dynamic>))
          .toList(),
      firstUpdateId: json['U'] as int?,
      lastUpdateId: (json['lastUpdateId'] ??= json['u']) as int,
    );
  }
}

extension OrderBookDTOMapper on OrderBookDTO {
  static OrderBook toModel(OrderBookDTO dto) {
    return OrderBook(
      bids: [...dto.bids.map(OrderBookLevelDTOMapper.toModel)],
      asks: [...dto.asks.map(OrderBookLevelDTOMapper.toModel)],
      firstUpdateId: dto.firstUpdateId,
      lastUpdateId: dto.lastUpdateId,
    );
  }
}
