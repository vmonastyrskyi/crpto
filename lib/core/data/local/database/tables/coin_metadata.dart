import 'dart:convert';

import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:drift/drift.dart';

@DataClassName('CoinMetadataDTO')
class CoinsMetadata extends Table {
  late final TextColumn symbol = text()();
  late final TextColumn baseAsset = text()();
  late final TextColumn quoteAsset = text()();
  late final TextColumn displayName = text()();
  late final TextColumn status = text()();
  late final TextColumn relatedSymbols = text().map(StringListConverter())();

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

  Future<void> insertAll(List<CoinMetadataDTO> coinMetadataDTOs) {
    _cache.addAll(coinMetadataDTOs);

    return crptoDB.batch((batch) {
      batch.insertAllOnConflictUpdate(crptoDB.coinsMetadata, coinMetadataDTOs);
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
      relatedSymbols: coinMetadata.relatedSymbols,
    );
  }

  static CoinMetadata toModel(CoinMetadataDTO dto) {
    return CoinMetadata(
      symbol: dto.symbol,
      baseAsset: dto.baseAsset,
      quoteAsset: dto.quoteAsset,
      displayName: dto.displayName,
      status: dto.status,
      relatedSymbols: dto.relatedSymbols,
    );
  }
}

class StringListConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> fromSql(String fromDb) {
    return [...(jsonDecode(fromDb) as List).map((item) => item as String)];
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}
