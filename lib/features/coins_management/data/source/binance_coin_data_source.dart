import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/features/coins_management/data/dto/get_exchange_info_response.dart';
import 'package:crpto/features/coins_management/data/source/i_coin_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/binance_coin_data_source.g.dart';

@riverpod
ICoinDataSource binanceCoinDataSource(Ref ref) {
  final baseUrl = 'https://api.binance.com/api/v3/';

  final dio = ref.watch(dioClientProvider(baseUrl: baseUrl));

  return BinanceCoinDataSource(dio);
}

@RestApi()
abstract class BinanceCoinDataSource implements ICoinDataSource {
  factory BinanceCoinDataSource(Dio dio, {String baseUrl}) =
      _BinanceCoinDataSource;

  @override
  @GET("/exchangeInfo")
  Future<GetExchangeInfoResponse> getExchangeInfo();
}
