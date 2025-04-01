import 'package:crpto/shared/data/dto/coin_ticker_dto.dart';
import 'package:crpto/shared/data/source/ticker/binance_ticker_data_source.dart';
import 'package:crpto/shared/data/source/ticker/i_ticker_data_source.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/repository/i_ticker_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/ticker_repository.g.dart';

@riverpod
class TickerRepository extends _$TickerRepository implements ITickerRepository {
  late ITickerDataSource _tickerDataSource;

  @override
  Raw<Future<ITickerRepository>> build() async {
    _tickerDataSource = await ref.watch(binanceTickerDataSourceProvider);

    return this;
  }

  @override
  Future<CoinTicker> getCoinTicker(String symbol) async {
    final coinTickerDTO = await _tickerDataSource.getCoinTicker(symbol);

    final coinTicker = CoinTickerDTOMapper.toModel(coinTickerDTO);

    return coinTicker;
  }

  @override
  Stream<CoinTicker> listenCoinTickers(List<String> symbols) {
    final coinTickerDTOsStream = _tickerDataSource.watchCoinTickers(symbols);

    final coinTickersStream = coinTickerDTOsStream.map(
      CoinTickerDTOMapper.toModel,
    );

    return coinTickersStream;
  }
}
