import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/shared/domain/model/enum/coin_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_dto.freezed.dart';
part 'generated/listed_coin_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class ListedCoinDTO with _$ListedCoinDTO {
  const ListedCoinDTO({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.status,
  });

  @override
  final String symbol;
  @override
  @JsonKey(name: 'baseAsset')
  final String baseAsset;
  @override
  @JsonKey(name: 'quoteAsset')
  final String quoteAsset;
  @override
  final CoinStatus status;

  factory ListedCoinDTO.fromJson(Map<String, dynamic> json) =>
      _$ListedCoinDTOFromJson(json);
}

extension ListedCoinDTOMapper on ListedCoinDTO {
  static ListedCoin toModel(ListedCoinDTO dto) {
    return ListedCoin(
      symbol: dto.symbol,
      baseAsset: dto.baseAsset,
      quoteAsset: dto.quoteAsset,
      status: dto.status,
    );
  }
}
