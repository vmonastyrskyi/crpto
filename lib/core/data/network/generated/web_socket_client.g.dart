// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../web_socket_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webSocketClientHash() => r'cec620feb0178429ab6e8e2be4bc58a9c1695202';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WebSocketClient
    extends BuildlessAutoDisposeNotifier<Raw<Future<WebSocketClient>>> {
  late final String url;

  Raw<Future<WebSocketClient>> build({required String url});
}

/// See also [WebSocketClient].
@ProviderFor(WebSocketClient)
const webSocketClientProvider = WebSocketClientFamily();

/// See also [WebSocketClient].
class WebSocketClientFamily extends Family<Raw<Future<WebSocketClient>>> {
  /// See also [WebSocketClient].
  const WebSocketClientFamily();

  /// See also [WebSocketClient].
  WebSocketClientProvider call({required String url}) {
    return WebSocketClientProvider(url: url);
  }

  @override
  WebSocketClientProvider getProviderOverride(
    covariant WebSocketClientProvider provider,
  ) {
    return call(url: provider.url);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'webSocketClientProvider';
}

/// See also [WebSocketClient].
class WebSocketClientProvider
    extends
        AutoDisposeNotifierProviderImpl<
          WebSocketClient,
          Raw<Future<WebSocketClient>>
        > {
  /// See also [WebSocketClient].
  WebSocketClientProvider({required String url})
    : this._internal(
        () => WebSocketClient()..url = url,
        from: webSocketClientProvider,
        name: r'webSocketClientProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$webSocketClientHash,
        dependencies: WebSocketClientFamily._dependencies,
        allTransitiveDependencies:
            WebSocketClientFamily._allTransitiveDependencies,
        url: url,
      );

  WebSocketClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Raw<Future<WebSocketClient>> runNotifierBuild(
    covariant WebSocketClient notifier,
  ) {
    return notifier.build(url: url);
  }

  @override
  Override overrideWith(WebSocketClient Function() create) {
    return ProviderOverride(
      origin: this,
      override: WebSocketClientProvider._internal(
        () => create()..url = url,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    WebSocketClient,
    Raw<Future<WebSocketClient>>
  >
  createElement() {
    return _WebSocketClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WebSocketClientProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WebSocketClientRef
    on AutoDisposeNotifierProviderRef<Raw<Future<WebSocketClient>>> {
  /// The parameter `url` of this provider.
  String get url;
}

class _WebSocketClientProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          WebSocketClient,
          Raw<Future<WebSocketClient>>
        >
    with WebSocketClientRef {
  _WebSocketClientProviderElement(super.provider);

  @override
  String get url => (origin as WebSocketClientProvider).url;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
