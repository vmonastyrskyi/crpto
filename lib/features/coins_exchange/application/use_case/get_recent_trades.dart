import 'package:crpto/features/coins_exchange/data/repository/trade_repository.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/domain/repository/i_trade_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_recent_trades.g.dart';

@riverpod
class GetRecentTradesUseCase extends _$GetRecentTradesUseCase {
  late ITradeRepository _tradeRepository;

  @override
  Raw<Future<GetRecentTradesUseCase>> build() async {
    _tradeRepository = await ref.watch(tradeRepositoryProvider);

    return this;
  }

  Future<List<RecentTrade>> call(String symbol, {int limit = 1}) =>
      _tradeRepository.getRecentTrades(limit: limit, symbol);
}
