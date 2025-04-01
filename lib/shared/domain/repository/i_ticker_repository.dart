import 'package:crpto/shared/domain/model/coin_ticker.dart';

abstract interface class ITickerRepository {
  Future<CoinTicker> getCoinTicker(String symbol);

  Stream<CoinTicker> listenCoinTickers(List<String> symbols);
}
