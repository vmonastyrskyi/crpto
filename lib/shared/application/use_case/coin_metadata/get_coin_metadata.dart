import 'package:crpto/shared/data/repository/local_coin_metadata_repository.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/repository/i_coin_metadata_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_coin_metadata.g.dart';

@riverpod
class GetCoinMetadataUseCase extends _$GetCoinMetadataUseCase {
  late ICoinMetadataRepository _coinMetadataRepository;

  @override
  GetCoinMetadataUseCase build() {
    _coinMetadataRepository = ref.watch(localCoinMetadataRepositoryProvider);

    return this;
  }

  CoinMetadata call(String symbol) => _coinMetadataRepository.get(symbol);
}
