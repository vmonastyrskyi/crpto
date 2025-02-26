import 'dart:convert';

import 'package:crpto/features/coins_exchange/data/dto/coin_exchange_stats_dto.dart';
import 'package:crpto/features/coins_exchange/data/source/binance_coin_data_source.dart';
import 'package:crpto/features/coins_exchange/data/source/i_coin_data_source.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/domain/repository/i_coin_repository.dart';
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
  Future<List<CoinExchangeStats>> getCoinsExchangeStats(
    List<String> symbols,
  ) async {
    final coinsExchangeStatsDTOs = await _coinDataSource.getCoinsExchangeStats(
      jsonEncode(symbols),
    );

    final coinsExchangeStats =
        coinsExchangeStatsDTOs
            .map((coinExchangeStatsDTO) => coinExchangeStatsDTO.toModel())
            .toList();

    return coinsExchangeStats;
  }
}
