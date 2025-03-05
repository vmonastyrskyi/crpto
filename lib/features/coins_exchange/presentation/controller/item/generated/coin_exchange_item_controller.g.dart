// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinExchangeItemControllerHash() =>
    r'04bccf0ddc99946f71c0ff2a12dbe7b3c4f22f2e';

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

abstract class _$CoinExchangeItemController
    extends BuildlessAutoDisposeNotifier<CoinExchangeItemState> {
  late final CoinExchangeStats coinExchangeStats;

  CoinExchangeItemState build(CoinExchangeStats coinExchangeStats);
}

/// See also [CoinExchangeItemController].
@ProviderFor(CoinExchangeItemController)
const coinExchangeItemControllerProvider = CoinExchangeItemControllerFamily();

/// See also [CoinExchangeItemController].
class CoinExchangeItemControllerFamily extends Family<CoinExchangeItemState> {
  /// See also [CoinExchangeItemController].
  const CoinExchangeItemControllerFamily();

  /// See also [CoinExchangeItemController].
  CoinExchangeItemControllerProvider call(CoinExchangeStats coinExchangeStats) {
    return CoinExchangeItemControllerProvider(coinExchangeStats);
  }

  @override
  CoinExchangeItemControllerProvider getProviderOverride(
    covariant CoinExchangeItemControllerProvider provider,
  ) {
    return call(provider.coinExchangeStats);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coinExchangeItemControllerProvider';
}

/// See also [CoinExchangeItemController].
class CoinExchangeItemControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CoinExchangeItemController,
          CoinExchangeItemState
        > {
  /// See also [CoinExchangeItemController].
  CoinExchangeItemControllerProvider(CoinExchangeStats coinExchangeStats)
    : this._internal(
        () =>
            CoinExchangeItemController()..coinExchangeStats = coinExchangeStats,
        from: coinExchangeItemControllerProvider,
        name: r'coinExchangeItemControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinExchangeItemControllerHash,
        dependencies: CoinExchangeItemControllerFamily._dependencies,
        allTransitiveDependencies:
            CoinExchangeItemControllerFamily._allTransitiveDependencies,
        coinExchangeStats: coinExchangeStats,
      );

  CoinExchangeItemControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.coinExchangeStats,
  }) : super.internal();

  final CoinExchangeStats coinExchangeStats;

  @override
  CoinExchangeItemState runNotifierBuild(
    covariant CoinExchangeItemController notifier,
  ) {
    return notifier.build(coinExchangeStats);
  }

  @override
  Override overrideWith(CoinExchangeItemController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinExchangeItemControllerProvider._internal(
        () => create()..coinExchangeStats = coinExchangeStats,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        coinExchangeStats: coinExchangeStats,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    CoinExchangeItemController,
    CoinExchangeItemState
  >
  createElement() {
    return _CoinExchangeItemControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinExchangeItemControllerProvider &&
        other.coinExchangeStats == coinExchangeStats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, coinExchangeStats.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoinExchangeItemControllerRef
    on AutoDisposeNotifierProviderRef<CoinExchangeItemState> {
  /// The parameter `coinExchangeStats` of this provider.
  CoinExchangeStats get coinExchangeStats;
}

class _CoinExchangeItemControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CoinExchangeItemController,
          CoinExchangeItemState
        >
    with CoinExchangeItemControllerRef {
  _CoinExchangeItemControllerProviderElement(super.provider);

  @override
  CoinExchangeStats get coinExchangeStats =>
      (origin as CoinExchangeItemControllerProvider).coinExchangeStats;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
