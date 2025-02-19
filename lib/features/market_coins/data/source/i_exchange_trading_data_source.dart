import 'package:crpto/features/market_coins/data/dto/get_exchange_info_response.dart';

abstract interface class IExchangeTradingDataSource {
  Future<GetExchangeInfoResponse> getExchangeInfo();
}
