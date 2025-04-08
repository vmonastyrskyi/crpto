import 'package:crpto/features/coins_management/data/dto/cmc_coin_id_dto.dart';
import 'package:crpto/features/coins_management/data/dto/cmc_coin_metadata_dto.dart';

abstract interface class ICoinMetadataDataSource {
  Future<Map<String, CmcCoinMetadataDTO>> getCoinsMetadata(
    Set<String> baseAssets,
  );

  Future<Map<String, CmcCoinIdDTO>> getCoinsId(Set<String> baseAssets);
}
