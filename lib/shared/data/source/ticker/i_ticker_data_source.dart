import 'package:crpto/shared/data/dto/ticker/coin_ticker_dto.dart';

abstract interface class ITickerDataSource {
  Future<List<CoinTickerDTO>> getCoinTickers(List<String> symbols);

  Stream<CoinTickerDTO> watchCoinTickers(List<String> symbols);
}
