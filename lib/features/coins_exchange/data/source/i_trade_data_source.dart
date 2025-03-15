import 'package:crpto/features/coins_exchange/data/dto/recent_trade_dto.dart';

abstract interface class ITradeDataSource {
  Future<List<RecentTradeDTO>> getRecentTrades(String symbol, {int? limit});

  Stream<RecentTradeDTO> watchRecentTrades(List<String> symbols);
}
