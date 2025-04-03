import 'package:crpto/core/data/local/database/tables/coin_metadata.dart';
import 'package:crpto/shared/data/source/coin_metadata/drift_coin_metadata_data_source.dart';
import 'package:crpto/shared/data/source/coin_metadata/i_coin_metadata_data_source.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/repository/i_coin_metadata_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_metadata_repository.g.dart';

@riverpod
class CoinMetadataRepository extends _$CoinMetadataRepository
    implements ICoinMetadataRepository {
  late ICoinMetadataDataSource _coinMetadataDataSource;

  @override
  ICoinMetadataRepository build() {
    _coinMetadataDataSource = ref.watch(driftCoinMetadataDataSourceProvider);

    return this;
  }

  @override
  CoinMetadata getBySymbol(String symbol) {
    final coinMetadataDTO = _coinMetadataDataSource.getBySymbol(symbol);

    final coinMetadata = CoinMetadataDTOMapper.toModel(coinMetadataDTO);

    return coinMetadata;
  }

  @override
  Future<void> addAll(List<CoinMetadata> coinMetadataList) {
    final coinMetadataDTOList =
        coinMetadataList.map(CoinMetadataDTOMapper.fromModel).toList();

    return _coinMetadataDataSource.insertAll(coinMetadataDTOList);
  }
}
