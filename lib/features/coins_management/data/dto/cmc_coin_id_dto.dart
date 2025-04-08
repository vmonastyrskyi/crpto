import 'package:crpto/features/coins_management/domain/model/cmc_coin_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/cmc_coin_id_dto.freezed.dart';
part 'generated/cmc_coin_id_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class CmcCoinIdDTO with _$CmcCoinIdDTO {
  const CmcCoinIdDTO({
    required this.id,
    required this.baseAsset,
    required this.slug,
    this.rank,
  });

  @override
  final int id;
  @override
  @JsonKey(name: 'symbol')
  final String baseAsset;
  @override
  final String slug;
  @override
  final int? rank;

  factory CmcCoinIdDTO.fromJson(Map<String, dynamic> json) =>
      _$CmcCoinIdDTOFromJson(json);
}

extension CmcCoinIdDTOMapper on CmcCoinIdDTO {
  static CmcCoinId toModel(CmcCoinIdDTO dto) {
    return CmcCoinId(
      id: dto.id,
      baseAsset: dto.baseAsset,
      slug: dto.slug,
      rank: dto.rank,
    );
  }
}
