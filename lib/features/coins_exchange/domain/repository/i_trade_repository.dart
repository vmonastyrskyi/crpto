import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';

abstract interface class ITradeRepository {
  Stream<RecentTrade> listenRecentTrades(List<String> symbols);
}
