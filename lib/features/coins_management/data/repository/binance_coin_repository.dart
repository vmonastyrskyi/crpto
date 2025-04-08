import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';
import 'package:crpto/features/coins_management/data/source/binance_coin_data_source.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_data_source.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/binance_coin_repository.g.dart';

@riverpod
class BinanceCoinRepository extends _$BinanceCoinRepository
    implements ICoinRepository {
  late ICoinDataSource _binanceCoinDataSource;

  @override
  ICoinRepository build() {
    _binanceCoinDataSource = ref.watch(binanceCoinDataSourceProvider);

    return this;
  }

  @override
  Future<List<ListedCoin>> getListedCoins() async {
    final listedCoinDTOs = await _binanceCoinDataSource.getListedCoins();

    final listedCoins = [...listedCoinDTOs.map(ListedCoinDTOMapper.toModel)];

    return listedCoins;
  }
}
