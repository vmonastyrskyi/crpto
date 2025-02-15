import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';

abstract interface class IExchangeTradingRepository {
  Future<List<ListedCoin>> getListedCoins();
}
