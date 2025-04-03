import 'package:crpto/features/coins_exchange/data/repository/trade_repository.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/domain/repository/i_trade_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listen_recent_trades.g.dart';

@riverpod
class ListenRecentTradesUseCase extends _$ListenRecentTradesUseCase {
  late ITradeRepository _tradeRepository;

  @override
  Raw<Future<ListenRecentTradesUseCase>> build() async {
    _tradeRepository = await ref.watch(tradeRepositoryProvider);

    return this;
  }

  Stream<RecentTrade> call(List<String> symbols) =>
      _tradeRepository.listenRecentTrades(symbols);
}
