import 'package:crpto/core/data/local/database/tables/coin_metadata.dart';
import 'package:crpto/shared/data/source/drift_coin_metadata_data_source.dart';
import 'package:crpto/shared/data/source/i_coin_metadata_data_source.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/repository/i_coin_metadata_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/local_coin_metadata_repository.g.dart';

@riverpod
class LocalCoinMetadataRepository extends _$LocalCoinMetadataRepository
    implements ICoinMetadataRepository {
  late ICoinMetadataDataSource _coinMetadataDataSource;

  @override
  ICoinMetadataRepository build() {
    _coinMetadataDataSource = ref.watch(driftCoinMetadataDataSourceProvider);

    return this;
  }

  @override
  CoinMetadata get(String symbol) {
    final coinMetadataDTO = _coinMetadataDataSource.get(symbol);

    final coinMetadata = CoinMetadataDTOMapper.toModel(coinMetadataDTO);

    return coinMetadata;
  }

  @override
  Future<void> addAll(List<CoinMetadata> coinsMetadata) {
    final coinMetadataDTOs = [
      ...coinsMetadata.map(CoinMetadataDTOMapper.fromModel),
    ];

    return _coinMetadataDataSource.insertAll(coinMetadataDTOs);
  }
}
