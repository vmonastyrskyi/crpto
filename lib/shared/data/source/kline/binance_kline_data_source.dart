import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/shared/data/dto/kline/kline_dto.dart';
import 'package:crpto/shared/data/source/kline/i_kline_data_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/binance_kline_data_source.g.dart';

@riverpod
final class BinanceKlineDataSource extends _$BinanceKlineDataSource
    implements IKlineDataSource {
  late final Dio _dio;

  @override
  IKlineDataSource build() {
    final baseUrl = 'https://api.binance.com/api/v3';

    _dio = ref.watch(dioClientProvider(baseUrl: baseUrl));

    return this;
  }

  @override
  Future<List<KlineDTO>> getAllBySymbol(
    String symbol, {
    required String interval,
    int? startTime,
    int? endTime,
    String? timeZone,
  }) async {
    const url = '/klines';

    final queryParameters = <String, dynamic>{
      'symbol': symbol,
      'interval': interval,
      if (startTime != null) 'startTime': startTime,
      if (endTime != null) 'endTime': endTime,
      if (timeZone != null) 'timeZone': timeZone,
    };

    final response = await _dio.get(url, queryParameters: queryParameters);

    final klineDTOs =
        List<dynamic>.from(
          response.data,
        ).map((list) => KlineDTO.fromList(list)).toList();

    return klineDTOs;
  }
}
