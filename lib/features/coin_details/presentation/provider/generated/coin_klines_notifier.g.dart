// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_klines_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinKlinesNotifierHash() =>
    r'5035a6974753ff3314f64bc04b38d9de99bc331d';

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

abstract class _$CoinKlinesNotifier
    extends
        BuildlessAutoDisposeAsyncNotifier<Map<KlinePeriod, List<CoinKline>>> {
  late final String symbol;

  FutureOr<Map<KlinePeriod, List<CoinKline>>> build(String symbol);
}

/// See also [CoinKlinesNotifier].
@ProviderFor(CoinKlinesNotifier)
const coinKlinesNotifierProvider = CoinKlinesNotifierFamily();

/// See also [CoinKlinesNotifier].
class CoinKlinesNotifierFamily
    extends Family<AsyncValue<Map<KlinePeriod, List<CoinKline>>>> {
  /// See also [CoinKlinesNotifier].
  const CoinKlinesNotifierFamily();

  /// See also [CoinKlinesNotifier].
  CoinKlinesNotifierProvider call(String symbol) {
    return CoinKlinesNotifierProvider(symbol);
  }

  @override
  CoinKlinesNotifierProvider getProviderOverride(
    covariant CoinKlinesNotifierProvider provider,
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
  String? get name => r'coinKlinesNotifierProvider';
}

/// See also [CoinKlinesNotifier].
class CoinKlinesNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CoinKlinesNotifier,
          Map<KlinePeriod, List<CoinKline>>
        > {
  /// See also [CoinKlinesNotifier].
  CoinKlinesNotifierProvider(String symbol)
    : this._internal(
        () => CoinKlinesNotifier()..symbol = symbol,
        from: coinKlinesNotifierProvider,
        name: r'coinKlinesNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinKlinesNotifierHash,
        dependencies: CoinKlinesNotifierFamily._dependencies,
        allTransitiveDependencies:
            CoinKlinesNotifierFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinKlinesNotifierProvider._internal(
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
  FutureOr<Map<KlinePeriod, List<CoinKline>>> runNotifierBuild(
    covariant CoinKlinesNotifier notifier,
  ) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(CoinKlinesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinKlinesNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<
    CoinKlinesNotifier,
    Map<KlinePeriod, List<CoinKline>>
  >
  createElement() {
    return _CoinKlinesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinKlinesNotifierProvider && other.symbol == symbol;
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
mixin CoinKlinesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Map<KlinePeriod, List<CoinKline>>> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinKlinesNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CoinKlinesNotifier,
          Map<KlinePeriod, List<CoinKline>>
        >
    with CoinKlinesNotifierRef {
  _CoinKlinesNotifierProviderElement(super.provider);

  @override
  String get symbol => (origin as CoinKlinesNotifierProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
