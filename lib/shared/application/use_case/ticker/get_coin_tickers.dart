import 'package:crpto/shared/data/repository/ticker_repository.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:crpto/shared/domain/repository/i_ticker_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_coin_tickers.g.dart';

@riverpod
class GetCoinTickersUseCase extends _$GetCoinTickersUseCase {
  late final ITickerRepository _tickerRepository;

  @override
  Raw<Future<GetCoinTickersUseCase>> build() async {
    _tickerRepository = await ref.watch(tickerRepositoryProvider);

    return this;
  }

  Future<List<CoinTicker>> call(List<String> symbols) =>
      _tickerRepository.getCoinTickers(symbols);
}
