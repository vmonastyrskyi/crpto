// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_item_klines_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinExchangeItemKlinesControllerHash() =>
    r'63263cb9609d802e3ae4b3b78a9990cb60887349';

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

abstract class _$CoinExchangeItemKlinesController
    extends BuildlessAutoDisposeAsyncNotifier<CoinExchangeItemKlinesState> {
  late final String symbol;

  FutureOr<CoinExchangeItemKlinesState> build(String symbol);
}

/// See also [CoinExchangeItemKlinesController].
@ProviderFor(CoinExchangeItemKlinesController)
const coinExchangeItemKlinesControllerProvider =
    CoinExchangeItemKlinesControllerFamily();

/// See also [CoinExchangeItemKlinesController].
class CoinExchangeItemKlinesControllerFamily
    extends Family<AsyncValue<CoinExchangeItemKlinesState>> {
  /// See also [CoinExchangeItemKlinesController].
  const CoinExchangeItemKlinesControllerFamily();

  /// See also [CoinExchangeItemKlinesController].
  CoinExchangeItemKlinesControllerProvider call(String symbol) {
    return CoinExchangeItemKlinesControllerProvider(symbol);
  }

  @override
  CoinExchangeItemKlinesControllerProvider getProviderOverride(
    covariant CoinExchangeItemKlinesControllerProvider provider,
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
  String? get name => r'coinExchangeItemKlinesControllerProvider';
}

/// See also [CoinExchangeItemKlinesController].
class CoinExchangeItemKlinesControllerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          CoinExchangeItemKlinesController,
          CoinExchangeItemKlinesState
        > {
  /// See also [CoinExchangeItemKlinesController].
  CoinExchangeItemKlinesControllerProvider(String symbol)
    : this._internal(
        () => CoinExchangeItemKlinesController()..symbol = symbol,
        from: coinExchangeItemKlinesControllerProvider,
        name: r'coinExchangeItemKlinesControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinExchangeItemKlinesControllerHash,
        dependencies: CoinExchangeItemKlinesControllerFamily._dependencies,
        allTransitiveDependencies:
            CoinExchangeItemKlinesControllerFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinExchangeItemKlinesControllerProvider._internal(
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
  FutureOr<CoinExchangeItemKlinesState> runNotifierBuild(
    covariant CoinExchangeItemKlinesController notifier,
  ) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(CoinExchangeItemKlinesController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CoinExchangeItemKlinesControllerProvider._internal(
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
    CoinExchangeItemKlinesController,
    CoinExchangeItemKlinesState
  >
  createElement() {
    return _CoinExchangeItemKlinesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinExchangeItemKlinesControllerProvider &&
        other.symbol == symbol;
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
mixin CoinExchangeItemKlinesControllerRef
    on AutoDisposeAsyncNotifierProviderRef<CoinExchangeItemKlinesState> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinExchangeItemKlinesControllerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          CoinExchangeItemKlinesController,
          CoinExchangeItemKlinesState
        >
    with CoinExchangeItemKlinesControllerRef {
  _CoinExchangeItemKlinesControllerProviderElement(super.provider);

  @override
  String get symbol =>
      (origin as CoinExchangeItemKlinesControllerProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
