import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';

abstract interface class ITradeRepository {
  Future<List<RecentTrade>> getRecentTrades(String symbol, {int? limit});

  Stream<RecentTrade> listenRecentTrades(List<String> symbols);
}
