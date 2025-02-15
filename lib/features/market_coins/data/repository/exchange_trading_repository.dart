import 'package:crpto/features/market_coins/data/dto/listed_coin_dto.dart';
import 'package:crpto/features/market_coins/data/source/binance_exchange_trading_data_source.dart';
import 'package:crpto/features/market_coins/data/source/i_exchange_trading_data_source.dart';
import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';
import 'package:crpto/features/market_coins/domain/repository/i_exchange_trading_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/exchange_trading_repository.g.dart';

@riverpod
class ExchangeTradingRepository extends _$ExchangeTradingRepository
    implements IExchangeTradingRepository {
  late final IExchangeTradingDataSource _exchangeTradingDataSource;

  @override
  IExchangeTradingRepository build() {
    _exchangeTradingDataSource =
        ref.watch(binanceExchangeTradingDataSourceProvider);

    return this;
  }

  @override
  Future<List<ListedCoin>> getListedCoins() async {
    final response = await _exchangeTradingDataSource.getExchangeInfo();

    final listedCoins = response.listedCoins
        .map(
          (listedCoin) => listedCoin.toModel(),
        )
        .toList();

    return listedCoins;
  }
}
