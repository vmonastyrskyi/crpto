import 'dart:async';
import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'generated/web_socket_client.g.dart';

@riverpod
class WebSocketClient extends _$WebSocketClient {
  final StreamController _streamController = StreamController.broadcast();

  late final WebSocketChannel _channel;

  int _requestId = 1;

  @override
  Raw<Future<WebSocketClient>> build({required String url}) async {
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _streamController.addStream(_channel.stream);

    ref.onDispose(_channel.sink.close);

    await _ensureConnected();

    return this;
  }

  Stream<String> getMessages() =>
      _streamController.stream.map((message) => message as String);

  void sendMessage(String message) => _channel.sink.add(message);

  void subscribe(List<String> params) {
    final request = jsonEncode({
      'method': 'SUBSCRIBE',
      'params': params,
      'id': _requestId++,
    });

    sendMessage(request);
  }

  void unsubscribe(List<String> params) {
    final request = jsonEncode({
      'method': 'UNSUBSCRIBE',
      'params': params,
      'id': _requestId++,
    });

    sendMessage(request);
  }

  Future<void> _ensureConnected() async => await _channel.ready;
}
