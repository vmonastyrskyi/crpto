import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/features/market_coins/data/dto/get_exchange_info_response.dart';
import 'package:crpto/features/market_coins/data/source/i_exchange_trading_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/binance_exchange_trading_data_source.g.dart';

@riverpod
IExchangeTradingDataSource binanceExchangeTradingDataSource(Ref ref) {
  final baseUrl = 'https://api.binance.com/api/v3/';

  final dio = ref.watch(dioClientProvider(baseUrl: baseUrl));

  return BinanceExchangeTradingDataSource(dio);
}

@RestApi()
abstract class BinanceExchangeTradingDataSource
    implements IExchangeTradingDataSource {
  factory BinanceExchangeTradingDataSource(
    Dio dio, {
    String baseUrl,
  }) = _BinanceExchangeTradingDataSource;

  @override
  @GET("/exchangeInfo")
  Future<GetExchangeInfoResponse> getExchangeInfo();
}
