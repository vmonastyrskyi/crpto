import 'dart:convert';

import 'package:crpto/core/data/network/dio_client.dart';
import 'package:crpto/core/data/network/web_socket_client.dart';
import 'package:crpto/shared/data/dto/coin_ticker_dto.dart';
import 'package:crpto/shared/data/source/i_ticker_data_source.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'generated/binance_ticker_data_source.g.dart';

@riverpod
final class BinanceTickerDataSource extends _$BinanceTickerDataSource
    implements ITickerDataSource {
  late Dio _dio;
  late WebSocketClient _webSocket;

  List<String> _previousTickers = const [];

  @override
  Raw<Future<ITickerDataSource>> build() async {
    final dioUrl = 'https://api.binance.com/api/v3';
    final webSocketUrl = 'wss://data-stream.binance.vision/stream';

    _webSocket = await ref.watch(webSocketClientProvider(url: webSocketUrl));
    _dio = ref.watch(dioClientProvider(baseUrl: dioUrl));

    return this;
  }

  @override
  Future<CoinTickerDTO> getCoinTicker(String symbol) async {
    const url = '/ticker/24hr';

    final queryParameters = <String, dynamic>{'symbol': symbol};

    final response = await _dio.get(url, queryParameters: queryParameters);

    final coinTickerDTO = CoinTickerDTO.fromJson(response.data);

    return coinTickerDTO;
  }

  @override
  Future<List<CoinTickerDTO>> getCoinTickers([List<String>? symbols]) async {
    const url = '/ticker/24hr';

    final queryParameters = <String, dynamic>{
      if (symbols != null && symbols.isNotEmpty) 'symbols': jsonEncode(symbols),
    };

    final response = await _dio.get(url, queryParameters: queryParameters);

    final recentTradeDTOs = [
      ...List.from(response.data ?? const []).map((json) {
        return CoinTickerDTO.fromJson(json);
      }),
    ];

    return recentTradeDTOs;
  }

  @override
  Stream<CoinTickerDTO> watchCoinTickers(List<String> symbols) async* {
    final tickers =
        symbols.map((symbol) => '${symbol.toLowerCase()}@ticker').toList();

    final tickersToSubscribe =
        tickers.toSet().difference(_previousTickers.toSet()).toList();
    final tickersToUnsubscribe =
        _previousTickers.toSet().difference(tickers.toSet()).toList();

    if (tickersToUnsubscribe.isNotEmpty) {
      final request = jsonEncode({
        'method': 'UNSUBSCRIBE',
        'params': tickersToUnsubscribe,
        'id': const Uuid().v1(),
      });

      _webSocket.sendMessage(request);
    }

    if (tickersToSubscribe.isNotEmpty) {
      final request = jsonEncode({
        'method': 'SUBSCRIBE',
        'params': tickersToSubscribe,
        'id': const Uuid().v1(),
      });

      _webSocket.sendMessage(request);
    }

    _previousTickers = tickers;

    yield* _webSocket
        .getMessages()
        .map(jsonDecode)
        .where((json) => '${json['stream']}'.endsWith('@ticker'))
        .map((json) => CoinTickerDTO.fromJson(json['data']));
  }
}
