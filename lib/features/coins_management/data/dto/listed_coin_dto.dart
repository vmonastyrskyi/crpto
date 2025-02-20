import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_dto.freezed.dart';
part 'generated/listed_coin_dto.g.dart';

@freezed
class ListedCoinDTO with _$ListedCoinDTO {
  factory ListedCoinDTO({
    @JsonKey(name: 'symbol') required String symbol,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'baseAsset') required String baseAsset,
    @JsonKey(name: 'quoteAsset') required String quoteAsset,
  }) = _ListedCoinDTO;

  factory ListedCoinDTO.fromJson(Map<String, dynamic> json) =>
      _$ListedCoinDTOFromJson(json);
}

extension ListedCoinDTOMapper on ListedCoinDTO {
  ListedCoin toModel() {
    return ListedCoin(
      symbol: symbol,
      status: status,
      baseAsset: baseAsset,
      quoteAsset: quoteAsset,
    );
  }
}
