import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:drift/drift.dart';

@DataClassName('CoinMetadataDTO')
class CoinsMetadata extends Table {
  late final Column<String> symbol = text()();
  late final Column<String> baseAsset = text()();
  late final Column<String> quoteAsset = text()();
  late final Column<String> displayName = text()();
  late final Column<String> status = text()();

  final Set<CoinMetadataDTO> _cache = {};

  @override
  Set<Column<Object>> get primaryKey => {symbol};

  Future<void> loadCache() async {
    _cache
      ..clear()
      ..addAll(await crptoDB.coinsMetadata.select().get());
  }

  CoinMetadataDTO getBySymbol(String symbol) {
    return _cache.firstWhere((e) => e.symbol == symbol);
  }

  Future<void> insertAll(List<CoinMetadataDTO> coinMetadataDTOList) {
    _cache.addAll(coinMetadataDTOList);

    return crptoDB.batch((batch) {
      batch.insertAllOnConflictUpdate(
        crptoDB.coinsMetadata,
        coinMetadataDTOList,
      );
    });
  }
}

extension CoinMetadataDTOMapper on CoinMetadataDTO {
  static CoinMetadataDTO fromModel(CoinMetadata coinMetadata) {
    return CoinMetadataDTO(
      symbol: coinMetadata.symbol,
      baseAsset: coinMetadata.baseAsset,
      quoteAsset: coinMetadata.quoteAsset,
      displayName: coinMetadata.displayName,
      status: coinMetadata.status,
    );
  }

  static CoinMetadata toModel(CoinMetadataDTO coinMetadataDTO) {
    return CoinMetadata(
      symbol: coinMetadataDTO.symbol,
      baseAsset: coinMetadataDTO.baseAsset,
      quoteAsset: coinMetadataDTO.quoteAsset,
      displayName: coinMetadataDTO.displayName,
      status: coinMetadataDTO.status,
    );
  }
}
