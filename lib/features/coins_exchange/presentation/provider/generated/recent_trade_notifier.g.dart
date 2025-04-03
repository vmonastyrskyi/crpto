// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_trade_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentTradeNotifierHash() =>
    r'4f807501ca4d3fbdbfcdb6afe3ff15de0a89a89f';

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

abstract class _$RecentTradeNotifier
    extends BuildlessAutoDisposeNotifier<RecentTrade?> {
  late final String symbol;

  RecentTrade? build(String symbol);
}

/// See also [RecentTradeNotifier].
@ProviderFor(RecentTradeNotifier)
const recentTradeNotifierProvider = RecentTradeNotifierFamily();

/// See also [RecentTradeNotifier].
class RecentTradeNotifierFamily extends Family<RecentTrade?> {
  /// See also [RecentTradeNotifier].
  const RecentTradeNotifierFamily();

  /// See also [RecentTradeNotifier].
  RecentTradeNotifierProvider call(String symbol) {
    return RecentTradeNotifierProvider(symbol);
  }

  @override
  RecentTradeNotifierProvider getProviderOverride(
    covariant RecentTradeNotifierProvider provider,
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
  String? get name => r'recentTradeNotifierProvider';
}

/// See also [RecentTradeNotifier].
class RecentTradeNotifierProvider
    extends AutoDisposeNotifierProviderImpl<RecentTradeNotifier, RecentTrade?> {
  /// See also [RecentTradeNotifier].
  RecentTradeNotifierProvider(String symbol)
    : this._internal(
        () => RecentTradeNotifier()..symbol = symbol,
        from: recentTradeNotifierProvider,
        name: r'recentTradeNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$recentTradeNotifierHash,
        dependencies: RecentTradeNotifierFamily._dependencies,
        allTransitiveDependencies:
            RecentTradeNotifierFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  RecentTradeNotifierProvider._internal(
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
  RecentTrade? runNotifierBuild(covariant RecentTradeNotifier notifier) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(RecentTradeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecentTradeNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<RecentTradeNotifier, RecentTrade?>
  createElement() {
    return _RecentTradeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentTradeNotifierProvider && other.symbol == symbol;
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
mixin RecentTradeNotifierRef on AutoDisposeNotifierProviderRef<RecentTrade?> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _RecentTradeNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<RecentTradeNotifier, RecentTrade?>
    with RecentTradeNotifierRef {
  _RecentTradeNotifierProviderElement(super.provider);

  @override
  String get symbol => (origin as RecentTradeNotifierProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
