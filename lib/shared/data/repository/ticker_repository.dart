import 'package:crpto/shared/data/dto/ticker/coin_ticker_dto.dart';
import 'package:crpto/shared/data/source/ticker/binance_coin_data_source.dart';
import 'package:crpto/shared/data/source/ticker/i_ticker_data_source.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:crpto/shared/domain/repository/i_ticker_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/ticker_repository.g.dart';

@riverpod
class TickerRepository extends _$TickerRepository implements ITickerRepository {
  late final ITickerDataSource _tickerDataSource;

  @override
  Raw<Future<ITickerRepository>> build() async {
    _tickerDataSource = await ref.watch(binanceTickerDataSourceProvider);

    return this;
  }

  @override
  Future<List<CoinTicker>> getCoinTickers(List<String> symbols) async {
    final coinTickerDTOs = await _tickerDataSource.getCoinTickers(symbols);

    final coinTickers =
        coinTickerDTOs.map(CoinTickerDTOMapper.toModel).toList();

    return coinTickers;
  }

  @override
  Stream<CoinTicker> listenCoinTickers(List<String> symbols) {
    final coinTickersStream = _tickerDataSource.watchCoinTickers(symbols);

    return coinTickersStream.map(CoinTickerDTOMapper.toModel);
  }
}
