import 'package:crpto/core/data/local/database/database.dart';

abstract interface class ICoinMetadataDataSource {
  CoinMetadataDTO getBySymbol(String symbol);

  Future<void> insertAll(List<CoinMetadataDTO> coinMetadataDTOs);
}
