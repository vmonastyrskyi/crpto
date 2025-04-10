import 'package:crpto/features/coins_management/domain/model/cmc_coin_metadata.dart';
import 'package:crpto/shared/domain/model/enum/coin_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/cmc_coin_metadata_dto.freezed.dart';
part 'generated/cmc_coin_metadata_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class CmcCoinMetadataDTO with _$CmcCoinMetadataDTO {
  const CmcCoinMetadataDTO({
    required this.id,
    required this.baseAsset,
    required this.slug,
    required this.name,
    required this.description,
    required this.category,
    required this.logo,
    required this.dateAdded,
  });

  @override
  final int id;
  @override
  @JsonKey(name: 'symbol')
  final String baseAsset;
  @override
  final String slug;
  @override
  final String name;
  @override
  final String description;
  @override
  final CoinCategory category;
  @override
  final String logo;
  @override
  final DateTime dateAdded;

  factory CmcCoinMetadataDTO.fromJson(Map<String, dynamic> json) =>
      _$CmcCoinMetadataDTOFromJson(json);
}

extension CmcCoinMetadataDTOMapper on CmcCoinMetadataDTO {
  static CmcCoinMetadata toModel(CmcCoinMetadataDTO dto) {
    return CmcCoinMetadata(
      id: dto.id,
      baseAsset: dto.baseAsset,
      slug: dto.slug,
      name: dto.name,
      description: dto.description,
      category: dto.category,
      logo: dto.logo,
      dateAdded: dto.dateAdded,
    );
  }
}
