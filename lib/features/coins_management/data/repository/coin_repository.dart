import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';
import 'package:crpto/features/coins_management/data/source/binance_coin_data_source.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_data_source.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_repository.g.dart';

@riverpod
class CoinRepository extends _$CoinRepository implements ICoinRepository {
  late final ICoinDataSource _coinDataSource;

  @override
  ICoinRepository build() {
    _coinDataSource = ref.watch(binanceCoinDataSourceProvider);

    return this;
  }

  @override
  Future<List<ListedCoin>> getListedCoins() async {
    final response = await _coinDataSource.getExchangeInfo();

    final listedCoins =
        response.listedCoins.map((listedCoin) => listedCoin.toModel()).toList();

    return listedCoins;
  }
}
