// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_metadata.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinMetadataHash() => r'dbb7c6f4005930aa24a35126384cf4f6e0b19945';

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

/// See also [coinMetadata].
@ProviderFor(coinMetadata)
const coinMetadataProvider = CoinMetadataFamily();

/// See also [coinMetadata].
class CoinMetadataFamily extends Family<CoinMetadata> {
  /// See also [coinMetadata].
  const CoinMetadataFamily();

  /// See also [coinMetadata].
  CoinMetadataProvider call(String symbol) {
    return CoinMetadataProvider(symbol);
  }

  @override
  CoinMetadataProvider getProviderOverride(
    covariant CoinMetadataProvider provider,
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
  String? get name => r'coinMetadataProvider';
}

/// See also [coinMetadata].
class CoinMetadataProvider extends AutoDisposeProvider<CoinMetadata> {
  /// See also [coinMetadata].
  CoinMetadataProvider(String symbol)
    : this._internal(
        (ref) => coinMetadata(ref as CoinMetadataRef, symbol),
        from: coinMetadataProvider,
        name: r'coinMetadataProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$coinMetadataHash,
        dependencies: CoinMetadataFamily._dependencies,
        allTransitiveDependencies:
            CoinMetadataFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  CoinMetadataProvider._internal(
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
  Override overrideWith(
    CoinMetadata Function(CoinMetadataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CoinMetadataProvider._internal(
        (ref) => create(ref as CoinMetadataRef),
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
  AutoDisposeProviderElement<CoinMetadata> createElement() {
    return _CoinMetadataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CoinMetadataProvider && other.symbol == symbol;
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
mixin CoinMetadataRef on AutoDisposeProviderRef<CoinMetadata> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _CoinMetadataProviderElement
    extends AutoDisposeProviderElement<CoinMetadata>
    with CoinMetadataRef {
  _CoinMetadataProviderElement(super.provider);

  @override
  String get symbol => (origin as CoinMetadataProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
