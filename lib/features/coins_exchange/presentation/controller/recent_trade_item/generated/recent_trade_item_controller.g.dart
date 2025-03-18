// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_trade_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentTradeItemControllerHash() =>
    r'c8b2504df27d9082f159373697c703cb3199fcbf';

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

abstract class _$RecentTradeItemController
    extends BuildlessAutoDisposeNotifier<RecentTradeItemState> {
  late final String symbol;

  RecentTradeItemState build(String symbol);
}

/// See also [RecentTradeItemController].
@ProviderFor(RecentTradeItemController)
const recentTradeItemControllerProvider = RecentTradeItemControllerFamily();

/// See also [RecentTradeItemController].
class RecentTradeItemControllerFamily extends Family<RecentTradeItemState> {
  /// See also [RecentTradeItemController].
  const RecentTradeItemControllerFamily();

  /// See also [RecentTradeItemController].
  RecentTradeItemControllerProvider call(String symbol) {
    return RecentTradeItemControllerProvider(symbol);
  }

  @override
  RecentTradeItemControllerProvider getProviderOverride(
    covariant RecentTradeItemControllerProvider provider,
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
  String? get name => r'recentTradeItemControllerProvider';
}

/// See also [RecentTradeItemController].
class RecentTradeItemControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          RecentTradeItemController,
          RecentTradeItemState
        > {
  /// See also [RecentTradeItemController].
  RecentTradeItemControllerProvider(String symbol)
    : this._internal(
        () => RecentTradeItemController()..symbol = symbol,
        from: recentTradeItemControllerProvider,
        name: r'recentTradeItemControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$recentTradeItemControllerHash,
        dependencies: RecentTradeItemControllerFamily._dependencies,
        allTransitiveDependencies:
            RecentTradeItemControllerFamily._allTransitiveDependencies,
        symbol: symbol,
      );

  RecentTradeItemControllerProvider._internal(
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
  RecentTradeItemState runNotifierBuild(
    covariant RecentTradeItemController notifier,
  ) {
    return notifier.build(symbol);
  }

  @override
  Override overrideWith(RecentTradeItemController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RecentTradeItemControllerProvider._internal(
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
    RecentTradeItemController,
    RecentTradeItemState
  >
  createElement() {
    return _RecentTradeItemControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentTradeItemControllerProvider && other.symbol == symbol;
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
mixin RecentTradeItemControllerRef
    on AutoDisposeNotifierProviderRef<RecentTradeItemState> {
  /// The parameter `symbol` of this provider.
  String get symbol;
}

class _RecentTradeItemControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          RecentTradeItemController,
          RecentTradeItemState
        >
    with RecentTradeItemControllerRef {
  _RecentTradeItemControllerProviderElement(super.provider);

  @override
  String get symbol => (origin as RecentTradeItemControllerProvider).symbol;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
