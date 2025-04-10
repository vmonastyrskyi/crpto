import 'package:crpto/shared/domain/model/coin_metadata.dart';

abstract interface class ICoinMetadataRepository {
  CoinMetadata get(String symbol);

  Future<void> addAll(List<CoinMetadata> coinMetadataList);
}
