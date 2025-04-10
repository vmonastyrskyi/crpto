import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/data/source/i_coin_metadata_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/drift_coin_metadata_data_source.g.dart';

@riverpod
class DriftCoinMetadataDataSource extends _$DriftCoinMetadataDataSource
    implements ICoinMetadataDataSource {
  @override
  ICoinMetadataDataSource build() => this;

  @override
  CoinMetadataDTO get(String symbol) =>
      crptoDB.coinsMetadata.getBySymbol(symbol);

  @override
  Future<void> insertAll(List<CoinMetadataDTO> coinMetadataDTOs) =>
      crptoDB.coinsMetadata.insertAll(coinMetadataDTOs);
}
