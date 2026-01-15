// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../web_socket_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WebSocketClient)
const webSocketClientProvider = WebSocketClientFamily._();

final class WebSocketClientProvider
    extends $NotifierProvider<WebSocketClient, Raw<Future<WebSocketClient>>> {
  const WebSocketClientProvider._({
    required WebSocketClientFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'webSocketClientProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$webSocketClientHash();

  @override
  String toString() {
    return r'webSocketClientProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WebSocketClient create() => WebSocketClient();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<WebSocketClient>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<WebSocketClient>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WebSocketClientProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$webSocketClientHash() => r'4f113c9e3bc99cf89be720201594d2455745400b';

final class WebSocketClientFamily extends $Family
    with
        $ClassFamilyOverride<
          WebSocketClient,
          Raw<Future<WebSocketClient>>,
          Raw<Future<WebSocketClient>>,
          Raw<Future<WebSocketClient>>,
          String
        > {
  const WebSocketClientFamily._()
    : super(
        retry: null,
        name: r'webSocketClientProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WebSocketClientProvider call({required String url}) =>
      WebSocketClientProvider._(argument: url, from: this);

  @override
  String toString() => r'webSocketClientProvider';
}

abstract class _$WebSocketClient
    extends $Notifier<Raw<Future<WebSocketClient>>> {
  late final _$args = ref.$arg as String;
  String get url => _$args;

  Raw<Future<WebSocketClient>> build({required String url});
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(url: _$args);
    final ref =
        this.ref
            as $Ref<Raw<Future<WebSocketClient>>, Raw<Future<WebSocketClient>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<WebSocketClient>>,
                Raw<Future<WebSocketClient>>
              >,
              Raw<Future<WebSocketClient>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
