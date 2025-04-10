import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/model/enum/coin_category.dart';
import 'package:drift/drift.dart';

@DataClassName('CoinMetadataDTO')
class CoinsMetadata extends Table {
  late final IntColumn id = integer()();
  late final TextColumn symbol = text()();
  late final TextColumn baseAsset = text()();
  late final TextColumn quoteAsset = text()();
  late final TextColumn slug = text()();
  late final TextColumn name = text()();
  late final TextColumn description = text()();
  late final TextColumn category = textEnum<CoinCategory>()();
  late final TextColumn logo = text()();
  late final DateTimeColumn dateAdded = dateTime()();
  late final IntColumn rank = integer()();

  final Set<CoinMetadataDTO> _cache = {};

  @override
  Set<Column<Object>> get primaryKey => {id};

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
      id: coinMetadata.id,
      symbol: coinMetadata.symbol,
      baseAsset: coinMetadata.baseAsset,
      quoteAsset: coinMetadata.quoteAsset,
      slug: coinMetadata.slug,
      name: coinMetadata.name,
      description: coinMetadata.description,
      category: coinMetadata.category,
      logo: coinMetadata.logo,
      dateAdded: coinMetadata.dateAdded,
      rank: coinMetadata.rank,
    );
  }

  static CoinMetadata toModel(CoinMetadataDTO dto) {
    return CoinMetadata(
      id: dto.id,
      symbol: dto.symbol,
      baseAsset: dto.baseAsset,
      quoteAsset: dto.quoteAsset,
      slug: dto.slug,
      name: dto.name,
      description: dto.description,
      category: dto.category,
      logo: dto.logo,
      dateAdded: dto.dateAdded,
      rank: dto.rank,
    );
  }
}
