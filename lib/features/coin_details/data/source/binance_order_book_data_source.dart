import 'dart:convert';

import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/core/data/network/web_socket_client.dart';
import 'package:crpto/features/coin_details/data/dto/order_book_dto.dart';
import 'package:crpto/features/coin_details/data/source/i_order_book_data_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/binance_order_book_data_source.g.dart';

@riverpod
class BinanceOrderBookDataSource extends _$BinanceOrderBookDataSource
    implements IOrderBookDataSource {
  late Dio _dio;
  late WebSocketClient _webSocket;

  @override
  Raw<Future<IOrderBookDataSource>> build() async {
    final dioUrl = 'https://api.binance.com/api/v3';
    final webSocketUrl = 'wss://data-stream.binance.vision/stream';

    _webSocket = await ref.watch(webSocketClientProvider(url: webSocketUrl));
    _dio = ref.watch(dioClientProvider(baseUrl: dioUrl));

    return this;
  }

  @override
  Future<OrderBookDTO> get(String symbol, {int? limit}) async {
    const url = '/depth';

    final queryParameters = <String, dynamic>{
      if (limit != null) 'limit': limit,
      'symbol': symbol,
    };

    final response = await _dio.get(url, queryParameters: queryParameters);

    final orderBookDTO = OrderBookDTO.fromJson(response.data);

    return orderBookDTO;
  }

  @override
  Stream<OrderBookDTO> watch(String symbol) async* {
    final symbolDepth = '${symbol.toLowerCase()}@depth';

    final request = jsonEncode({
      'method': 'SUBSCRIBE',
      'params': [symbolDepth],
      'id': const Uuid().v1(),
    });

    _webSocket.sendMessage(request);

    yield* _webSocket
        .getMessages()
        .map(jsonDecode)
        .where((json) => '${json['stream']}'.endsWith('@depth'))
        .map((json) => OrderBookDTO.fromJson(json['data']));
  }

  @override
  void unwatch(String symbol) {
    final symbolDepth = '${symbol.toLowerCase()}@depth';

    final request = jsonEncode({
      'method': 'UNSUBSCRIBE',
      'params': [symbolDepth],
      'id': const Uuid().v1(),
    });

    _webSocket.sendMessage(request);
  }
}
