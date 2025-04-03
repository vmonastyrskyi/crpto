import 'package:crpto/shared/data/repository/ticker_repository.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/repository/i_ticker_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_coin_ticker.g.dart';

@riverpod
class GetCoinTickerUseCase extends _$GetCoinTickerUseCase {
  late ITickerRepository _tickerRepository;

  @override
  Raw<Future<GetCoinTickerUseCase>> build() async {
    _tickerRepository = await ref.watch(tickerRepositoryProvider);

    return this;
  }

  Future<CoinTicker> call(String symbol) =>
      _tickerRepository.getCoinTicker(symbol);
}
