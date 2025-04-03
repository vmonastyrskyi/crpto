import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/domain/model/enum/trade_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade_dto.freezed.dart';

@freezed
@JsonSerializable(createFactory: false, createToJson: false)
class RecentTradeDTO with _$RecentTradeDTO {
  const RecentTradeDTO({
    required this.id,
    required this.symbol,
    required this.price,
    required this.quantity,
    required this.isBuyerMaker,
  });

  @override
  final int id;
  @override
  final String symbol;
  @override
  final String price;
  @override
  final String quantity;
  @override
  final bool isBuyerMaker;

  factory RecentTradeDTO.fromJson(Map<String, dynamic> json) {
    return RecentTradeDTO(
      id: (json['id'] ??= json['t']) as int,
      symbol: (json['symbol'] ??= json['s']) as String,
      price: (json['price'] ??= json['p']) as String,
      quantity: (json['qty'] ??= json['q']) as String,
      isBuyerMaker: (json['isBuyerMaker'] ??= json['m']) as bool,
    );
  }
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
