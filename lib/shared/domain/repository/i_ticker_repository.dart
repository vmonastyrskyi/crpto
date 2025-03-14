import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';

abstract interface class ITickerRepository {
  Future<List<CoinTicker>> getCoinTickers(List<String> symbols);

  Stream<CoinTicker> listenCoinTickers(List<String> symbols);
}
