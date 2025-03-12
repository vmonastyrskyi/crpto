import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/domain/model/trade_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade_dto.freezed.dart';
part 'generated/recent_trade_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class RecentTradeDTO with _$RecentTradeDTO {
  const RecentTradeDTO({
    required this.id,
    required this.symbol,
    required this.price,
    required this.quantity,
    required this.isBuyerMaker,
  });

  @override
  @JsonKey(name: 't')
  final int id;
  @override
  @JsonKey(name: 's')
  final String symbol;
  @override
  @JsonKey(name: 'p')
  final String price;
  @override
  @JsonKey(name: 'q')
  final String quantity;
  @override
  @JsonKey(name: 'm')
  final bool isBuyerMaker;

  factory RecentTradeDTO.fromJson(Map<String, dynamic> json) =>
      _$RecentTradeDTOFromJson(json);
}

extension RecentTradeDTOMapper on RecentTradeDTO {
  static RecentTrade toModel(RecentTradeDTO dto) {
    return RecentTrade(
      id: dto.id,
      symbol: dto.symbol,
      price: double.parse(dto.price),
      quantity: double.parse(dto.quantity),
      type: dto.isBuyerMaker ? TradeType.sell : TradeType.buy,
    );
  }
}
