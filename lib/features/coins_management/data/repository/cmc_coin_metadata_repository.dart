import 'package:crpto/features/coins_management/data/dto/cmc_coin_id_dto.dart';
import 'package:crpto/features/coins_management/data/dto/cmc_coin_metadata_dto.dart';
import 'package:crpto/features/coins_management/data/source/cmc_coin_metadata_data_source.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_metadata_data_source.dart';
import 'package:crpto/features/coins_management/domain/model/cmc_coin_id.dart';
import 'package:crpto/features/coins_management/domain/model/cmc_coin_metadata.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_metadata_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/cmc_coin_metadata_repository.g.dart';

@riverpod
class CmcCoinMetadataRepository extends _$CmcCoinMetadataRepository
    implements ICoinMetadataRepository {
  late ICoinMetadataDataSource _cmcCoinMetadataDataSource;

  @override
  ICoinMetadataRepository build() {
    _cmcCoinMetadataDataSource = ref.watch(cmcCoinMetadataDataSourceProvider);

    return this;
  }

  @override
  Future<Map<String, CmcCoinMetadata>> getCoinsMetadata(
    Set<String> baseAssets,
  ) async {
    final cmcCoinMetadataDTOMap = await _cmcCoinMetadataDataSource
        .getCoinsMetadata(baseAssets);

    final cmcCoinMetadataMap = cmcCoinMetadataDTOMap.map(
      (baseAsset, cmcCoinMetadataDTO) => MapEntry(
        baseAsset,
        CmcCoinMetadataDTOMapper.toModel(cmcCoinMetadataDTO),
      ),
    );

    return cmcCoinMetadataMap;
  }

  @override
  Future<Map<String, CmcCoinId>> getCoinsId(Set<String> baseAssets) async {
    final cmcCoinIdDTOMap = await _cmcCoinMetadataDataSource.getCoinsId(
      baseAssets,
    );

    final cmcCoinIdMap = cmcCoinIdDTOMap.map(
      (baseAsset, cmcCoinIdDTO) =>
          MapEntry(baseAsset, CmcCoinIdDTOMapper.toModel(cmcCoinIdDTO)),
    );

    return cmcCoinIdMap;
  }
}
