import 'package:crpto/shared/data/repository/ticker_repository.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/repository/i_ticker_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listen_coin_tickers.g.dart';

@riverpod
class ListenCoinTickersUseCase extends _$ListenCoinTickersUseCase {
  late final ITickerRepository _tickerRepository;

  @override
  Raw<Future<ListenCoinTickersUseCase>> build() async {
    _tickerRepository = await ref.watch(tickerRepositoryProvider);

    return this;
  }

  Stream<CoinTicker> call(List<String> symbols) =>
      _tickerRepository.listenCoinTickers(symbols);
}
