import 'package:crpto/features/coins_exchange/data/dto/recent_trade_dto.dart';
import 'package:crpto/features/coins_exchange/data/source/binance_trade_data_source.dart';
import 'package:crpto/features/coins_exchange/data/source/i_trade_data_source.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/domain/repository/i_trade_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/trade_repository.g.dart';

@riverpod
class TradeRepository extends _$TradeRepository implements ITradeRepository {
  late final ITradeDataSource _tradeDataSource;

  @override
  Raw<Future<ITradeRepository>> build() async {
    _tradeDataSource = await ref.watch(binanceTradeDataSourceProvider);

    return this;
  }

  @override
  Stream<RecentTrade> listenRecentTrades(List<String> symbols) {
    final recentTradeStream = _tradeDataSource.watchRecentTrades(symbols);

    return recentTradeStream.map(RecentTradeDTOMapper.toModel);
  }
}
