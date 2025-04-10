import 'package:crpto/features/coins_management/domain/model/cmc_coin_id.dart';
import 'package:crpto/features/coins_management/domain/model/cmc_coin_metadata.dart';

abstract interface class ICoinMetadataRepository {
  Future<Map<String, CmcCoinMetadata>> getCoinsMetadata(Set<String> baseAssets);

  Future<Map<String, CmcCoinId>> getCoinsId(Set<String> baseAssets);
}
