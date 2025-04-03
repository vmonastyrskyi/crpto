import 'package:crpto/shared/data/dto/coin_ticker_dto.dart';

abstract interface class ITickerDataSource {
  Future<CoinTickerDTO> getCoinTicker(String symbol);

  Future<List<CoinTickerDTO>> getCoinTickers([List<String>? symbols]);

  Stream<CoinTickerDTO> watchCoinTickers(List<String> symbols);
}
