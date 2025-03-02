import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
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
  @JsonKey(name: 'symbol')
  final String symbol;
  @override
  @JsonKey(name: 'baseAsset')
  final String baseAsset;
  @override
  @JsonKey(name: 'quoteAsset')
  final String quoteAsset;
  @override
  @JsonKey(name: 'status')
  final String status;

  factory ListedCoinDTO.fromJson(Map<String, dynamic> json) =>
      _$ListedCoinDTOFromJson(json);
}

extension ListedCoinDTOMapper on ListedCoinDTO {
  static ListedCoin toModel(ListedCoinDTO listedCoinDTO) {
    return ListedCoin(
      symbol: listedCoinDTO.symbol,
      baseAsset: listedCoinDTO.baseAsset,
      quoteAsset: listedCoinDTO.quoteAsset,
      status: listedCoinDTO.status,
    );
  }
}
