import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_dto.freezed.dart';
part 'generated/listed_coin_dto.g.dart';

@freezed
class ListedCoinDTO with _$ListedCoinDTO {
  factory ListedCoinDTO({
    @JsonKey(name: 'symbol') required String symbol,
    @JsonKey(name: 'baseAsset') required String baseAsset,
    @JsonKey(name: 'quoteAsset') required String quoteAsset,
    @JsonKey(name: 'status') required String status,
  }) = _ListedCoinDTO;

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
