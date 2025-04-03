import 'package:crpto/shared/domain/model/coin_ticker.dart';

abstract interface class ITickerRepository {
  Future<CoinTicker> getCoinTicker(String symbol);

  Future<List<CoinTicker>> getCoinTickers([List<String>? symbols]);

  Stream<CoinTicker> listenCoinTickers(List<String> symbols);
}
