// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinExchangeControllerHash() =>
    r'e51a7dac7693be18b635eba5dd9269bf60ed6cc5';

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

abstract class _$CoinExchangeController
    extends BuildlessAutoDisposeNotifier<CoinExchangeState> {
  late final CoinExchangeStats exchangeStats;

  CoinExchangeState build(CoinExchangeStats exchangeStats);
}

/// See also [CoinExchangeController].
@ProviderFor(CoinExchangeController)
const coinExchangeControllerProvider = CoinExchangeControllerFamily();

/// See also [CoinExchangeController].
class CoinExchangeControllerFamily extends Family<CoinExchangeState> {
  /// See also [CoinExchangeController].
  const CoinExchangeControllerFamily();

  /// See also [CoinExchangeController].
  CoinExchangeControllerProvider call(CoinExchangeStats exchangeStats) {
    return CoinExchangeControllerProvider(exchangeStats);
  }

  @override
  CoinExchangeControllerProvider getProviderOverride(
    covariant CoinExchangeControllerProvider provider,
  ) {
    return call(provider.exchangeStats);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'coinExchangeControllerProvider';
}

/// See also [CoinExchangeController].
class CoinExchangeControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          CoinExchangeController,
          CoinExchangeState
        > {
  /// See also [CoinExchangeController].
  CoinExchangeControllerProvider(CoinExchangeStats exchangeStats)
    : this._internal(
        () => CoinExchangeController()..exchangeStats = exchangeStats,
        from: coinExchangeControllerProvider,
        name: r'coinExchangeControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinExchangeControllerHash,
        dependencies: CoinExchangeControllerFamily._dependencies,
        allTransitiveDependencies:
            CoinExchangeControllerFamily._allTransitiveDependencies,
        exchangeStats: exchangeStats,
      );

  CoinExchangeControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exchangeStats,
  }) : super.internal();

  final CoinExchangeStats exchangeStats;

  @override
  CoinExchangeState runNotifierBuild(
    covariant CoinExchangeController notifier,
  ) {
    return notifier.build(exchangeStats);
  }

  @override
  Override overrideWith(CoinExchangeController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinExchangeControllerProvider._internal(
        () => create()..exchangeStats = exchangeStats,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exchangeStats: exchangeStats,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CoinExchangeController, CoinExchangeState>
  createElement() {
    return _CoinExchangeControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinExchangeControllerProvider &&
        other.exchangeStats == exchangeStats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exchangeStats.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CoinExchangeControllerRef
    on AutoDisposeNotifierProviderRef<CoinExchangeState> {
  /// The parameter `exchangeStats` of this provider.
  CoinExchangeStats get exchangeStats;
}

class _CoinExchangeControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          CoinExchangeController,
          CoinExchangeState
        >
    with CoinExchangeControllerRef {
  _CoinExchangeControllerProviderElement(super.provider);

  @override
  CoinExchangeStats get exchangeStats =>
      (origin as CoinExchangeControllerProvider).exchangeStats;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
