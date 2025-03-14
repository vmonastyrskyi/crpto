// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_kline_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinKlineListControllerHash() =>
    r'6989144fda5fecbb3259262659ab7c6b8b0859ad';

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

abstract class _$CoinKlineListController
    extends BuildlessAutoDisposeAsyncNotifier<CoinKlineListState> {
  late final String symbol;

  FutureOr<CoinKlineListState> build(String symbol);
}

/// See also [CoinKlineListController].
@ProviderFor(CoinKlineListController)
const coinKlineListControllerProvider = CoinKlineListControllerFamily();

/// See also [CoinKlineListController].
class CoinKlineListControllerFamily
    extends Family<AsyncValue<CoinKlineListState>> {
  /// See also [CoinKlineListController].
  const CoinKlineListControllerFamily();

  /// See also [CoinKlineListController].
  CoinKlineListControllerProvider call(String symbol) {
    return CoinKlineListControllerProvider(symbol);
  }

  @override
  CoinKlineListControllerProvider getProviderOverride(
    covariant CoinKlineListControllerProvider provider,
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
  String? get name => r'coinKlineListControllerProvider';
}

/// See also [CoinKlineListController].
class CoinKlineListControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CoinKlineListController,
          CoinKlineListState
        > {
  /// See also [CoinKlineListController].
  CoinKlineListControllerProvider(String symbol)
    : this._internal(
        () => CoinKlineListController()..symbol = symbol,
        from: coinKlineListControllerProvider,
        name: r'coinKlineListControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinKlineListControllerHash,
        dependencies: CoinKlineListControllerFamily._dependencies,
        allTransitiveDependencies:
            CoinKlineListControllerFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinKlineListControllerProvider._internal(
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
  FutureOr<CoinKlineListState> runNotifierBuild(
    covariant CoinKlineListController notifier,
  ) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(CoinKlineListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinKlineListControllerProvider._internal(
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
    CoinKlineListController,
    CoinKlineListState
  >
  createElement() {
    return _CoinKlineListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinKlineListControllerProvider && other.symbol == symbol;
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
mixin CoinKlineListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<CoinKlineListState> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinKlineListControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CoinKlineListController,
          CoinKlineListState
        >
    with CoinKlineListControllerRef {
  _CoinKlineListControllerProviderElement(super.provider);

  @override
  String get symbol => (origin as CoinKlineListControllerProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
