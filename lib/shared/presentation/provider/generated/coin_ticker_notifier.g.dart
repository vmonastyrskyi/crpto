// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_ticker_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinTickerNotifierHash() =>
    r'b8d41eb12359d64de7258ae4ca01a52037192527';

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

abstract class _$CoinTickerNotifier
    extends BuildlessAutoDisposeNotifier<CoinTicker?> {
  late final String symbol;

  CoinTicker? build(String symbol);
}

/// See also [CoinTickerNotifier].
@ProviderFor(CoinTickerNotifier)
const coinTickerNotifierProvider = CoinTickerNotifierFamily();

/// See also [CoinTickerNotifier].
class CoinTickerNotifierFamily extends Family<CoinTicker?> {
  /// See also [CoinTickerNotifier].
  const CoinTickerNotifierFamily();

  /// See also [CoinTickerNotifier].
  CoinTickerNotifierProvider call(String symbol) {
    return CoinTickerNotifierProvider(symbol);
  }

  @override
  CoinTickerNotifierProvider getProviderOverride(
    covariant CoinTickerNotifierProvider provider,
  ) {
    return call(provider.symbol);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coinTickerNotifierProvider';
}

/// See also [CoinTickerNotifier].
class CoinTickerNotifierProvider
    extends AutoDisposeNotifierProviderImpl<CoinTickerNotifier, CoinTicker?> {
  /// See also [CoinTickerNotifier].
  CoinTickerNotifierProvider(String symbol)
    : this._internal(
        () => CoinTickerNotifier()..symbol = symbol,
        from: coinTickerNotifierProvider,
        name: r'coinTickerNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinTickerNotifierHash,
        dependencies: CoinTickerNotifierFamily._dependencies,
        allTransitiveDependencies:
            CoinTickerNotifierFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinTickerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.symbol,
  }) : super.internal();

  final String symbol;

  @override
  CoinTicker? runNotifierBuild(covariant CoinTickerNotifier notifier) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(CoinTickerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinTickerNotifierProvider._internal(
        () => create()..symbol = symbol,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        symbol: symbol,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CoinTickerNotifier, CoinTicker?>
  createElement() {
    return _CoinTickerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinTickerNotifierProvider && other.symbol == symbol;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, symbol.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoinTickerNotifierRef on AutoDisposeNotifierProviderRef<CoinTicker?> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinTickerNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CoinTickerNotifier, CoinTicker?>
    with CoinTickerNotifierRef {
  _CoinTickerNotifierProviderElement(super.provider);

  @override
  String get symbol => (origin as CoinTickerNotifierProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
