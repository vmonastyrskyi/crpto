import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';

abstract interface class ICoinRepository {
  Future<List<CoinExchangeStats>> getCoinsExchangeStats(List<String> symbols);
}
