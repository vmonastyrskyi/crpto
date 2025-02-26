import 'package:crpto/features/coins_exchange/data/repository/coin_repository.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/domain/repository/i_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_coins_exchange_stats.g.dart';

@riverpod
class GetCoinsExchangeStatsUseCase extends _$GetCoinsExchangeStatsUseCase {
  late final ICoinRepository _coinRepository;

  @override
  GetCoinsExchangeStatsUseCase build() {
    _coinRepository = ref.watch(coinRepositoryProvider);

    return this;
  }

  Future<List<CoinExchangeStats>> call(List<String> symbols) =>
      _coinRepository.getCoinsExchangeStats(symbols);
}
