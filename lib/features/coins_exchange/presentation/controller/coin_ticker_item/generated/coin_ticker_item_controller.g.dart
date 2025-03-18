// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_ticker_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinTickerItemControllerHash() =>
    r'd07c7ce79315cedddee48db04d260ed272c39c10';

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

abstract class _$CoinTickerItemController
    extends BuildlessAutoDisposeNotifier<CoinTickerItemState> {
  late final String symbol;

  CoinTickerItemState build(String symbol);
}

/// See also [CoinTickerItemController].
@ProviderFor(CoinTickerItemController)
const coinTickerItemControllerProvider = CoinTickerItemControllerFamily();

/// See also [CoinTickerItemController].
class CoinTickerItemControllerFamily extends Family<CoinTickerItemState> {
  /// See also [CoinTickerItemController].
  const CoinTickerItemControllerFamily();

  /// See also [CoinTickerItemController].
  CoinTickerItemControllerProvider call(String symbol) {
    return CoinTickerItemControllerProvider(symbol);
  }

  @override
  CoinTickerItemControllerProvider getProviderOverride(
    covariant CoinTickerItemControllerProvider provider,
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
  String? get name => r'coinTickerItemControllerProvider';
}

/// See also [CoinTickerItemController].
class CoinTickerItemControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CoinTickerItemController,
          CoinTickerItemState
        > {
  /// See also [CoinTickerItemController].
  CoinTickerItemControllerProvider(String symbol)
    : this._internal(
        () => CoinTickerItemController()..symbol = symbol,
        from: coinTickerItemControllerProvider,
        name: r'coinTickerItemControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinTickerItemControllerHash,
        dependencies: CoinTickerItemControllerFamily._dependencies,
        allTransitiveDependencies:
            CoinTickerItemControllerFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinTickerItemControllerProvider._internal(
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
  CoinTickerItemState runNotifierBuild(
    covariant CoinTickerItemController notifier,
  ) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(CoinTickerItemController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinTickerItemControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<
    CoinTickerItemController,
    CoinTickerItemState
  >
  createElement() {
    return _CoinTickerItemControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinTickerItemControllerProvider && other.symbol == symbol;
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
mixin CoinTickerItemControllerRef
    on AutoDisposeNotifierProviderRef<CoinTickerItemState> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinTickerItemControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CoinTickerItemController,
          CoinTickerItemState
        >
    with CoinTickerItemControllerRef {
  _CoinTickerItemControllerProviderElement(super.provider);

  @override
  String get symbol => (origin as CoinTickerItemControllerProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
