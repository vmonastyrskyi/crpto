import 'package:crpto/features/coins_exchange/data/dto/coin_exchange_stats_dto.dart';

abstract interface class ICoinDataSource {
  Future<List<CoinExchangeStatsDTO>> getCoinsExchangeStats(String symbols);
}
