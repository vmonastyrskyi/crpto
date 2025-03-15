import 'dart:convert';

import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/core/data/network/web_socket_client.dart';
import 'package:crpto/features/coins_exchange/data/dto/recent_trade_dto.dart';
import 'package:crpto/features/coins_exchange/data/source/i_trade_data_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/binance_trade_data_source.g.dart';

@riverpod
class BinanceTradeDataSource extends _$BinanceTradeDataSource
    implements ITradeDataSource {
  late final Dio _dio;
  late final WebSocketClient _webSocket;

  List<String> _previousTrades = const [];

  @override
  Raw<Future<ITradeDataSource>> build() async {
    final dioUrl = 'https://api.binance.com/api/v3';
    final webSocketUrl = 'wss://data-stream.binance.vision/stream';

    _webSocket = await ref.watch(webSocketClientProvider(url: webSocketUrl));
    _dio = ref.watch(dioClientProvider(baseUrl: dioUrl));

    return this;
  }

  @override
  Future<List<RecentTradeDTO>> getRecentTrades(
    String symbol, {
    int? limit,
  }) async {
    const url = '/trades';

    final queryParameters = <String, dynamic>{
      if (limit != null) 'limit': limit,
      'symbol': symbol,
    };

    final response = await _dio.get(url, queryParameters: queryParameters);

    final recentTradeDTOs =
        List.from(response.data ?? const []).map((json) {
          json['symbol'] = json['s'] = symbol;

          return RecentTradeDTO.fromJson(json);
        }).toList();

    return recentTradeDTOs;
  }

  @override
  Stream<RecentTradeDTO> watchRecentTrades(List<String> symbols) async* {
    final trades =
        symbols.map((symbol) => '${symbol.toLowerCase()}@trade').toList();

    final tradesToSubscribe =
        trades.toSet().difference(_previousTrades.toSet()).toList();
    final tradesToUnsubscribe =
        _previousTrades.toSet().difference(trades.toSet()).toList();

    if (tradesToUnsubscribe.isNotEmpty) {
      final request = jsonEncode({
        'method': 'UNSUBSCRIBE',
        'params': tradesToUnsubscribe,
        'id': const Uuid().v1(),
      });

      _webSocket.sendMessage(request);
    }

    if (tradesToSubscribe.isNotEmpty) {
      final request = jsonEncode({
        'method': 'SUBSCRIBE',
        'params': tradesToSubscribe,
        'id': const Uuid().v1(),
      });

      _webSocket.sendMessage(request);
    }

    _previousTrades = trades;

    yield* _webSocket
        .getMessages()
        .map(jsonDecode)
        .where((json) => '${json['stream']}'.endsWith('@trade'))
        .map((json) => RecentTradeDTO.fromJson(json['data']));
  }
}
