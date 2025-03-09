// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_item_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listedCoinItemControllerHash() =>
    r'74d0e590ec674d0947b71ed4915ebfdf769afe4d';

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

abstract class _$ListedCoinItemController
    extends BuildlessAutoDisposeNotifier<ListedCoinItemState> {
  late final ListedCoin listedCoin;

  ListedCoinItemState build(ListedCoin listedCoin);
}

/// See also [ListedCoinItemController].
@ProviderFor(ListedCoinItemController)
const listedCoinItemControllerProvider = ListedCoinItemControllerFamily();

/// See also [ListedCoinItemController].
class ListedCoinItemControllerFamily extends Family<ListedCoinItemState> {
  /// See also [ListedCoinItemController].
  const ListedCoinItemControllerFamily();

  /// See also [ListedCoinItemController].
  ListedCoinItemControllerProvider call(ListedCoin listedCoin) {
    return ListedCoinItemControllerProvider(listedCoin);
  }

  @override
  ListedCoinItemControllerProvider getProviderOverride(
    covariant ListedCoinItemControllerProvider provider,
  ) {
    return call(provider.listedCoin);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listedCoinItemControllerProvider';
}

/// See also [ListedCoinItemController].
class ListedCoinItemControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          ListedCoinItemController,
          ListedCoinItemState
        > {
  /// See also [ListedCoinItemController].
  ListedCoinItemControllerProvider(ListedCoin listedCoin)
    : this._internal(
        () => ListedCoinItemController()..listedCoin = listedCoin,
        from: listedCoinItemControllerProvider,
        name: r'listedCoinItemControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$listedCoinItemControllerHash,
        dependencies: ListedCoinItemControllerFamily._dependencies,
        allTransitiveDependencies:
            ListedCoinItemControllerFamily._allTransitiveDependencies,
        listedCoin: listedCoin,
      );

  ListedCoinItemControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listedCoin,
  }) : super.internal();

  final ListedCoin listedCoin;

  @override
  ListedCoinItemState runNotifierBuild(
    covariant ListedCoinItemController notifier,
  ) {
    return notifier.build(listedCoin);
  }

  @override
  Override overrideWith(ListedCoinItemController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListedCoinItemControllerProvider._internal(
        () => create()..listedCoin = listedCoin,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listedCoin: listedCoin,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    ListedCoinItemController,
    ListedCoinItemState
  >
  createElement() {
    return _ListedCoinItemControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListedCoinItemControllerProvider &&
        other.listedCoin == listedCoin;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listedCoin.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListedCoinItemControllerRef
    on AutoDisposeNotifierProviderRef<ListedCoinItemState> {
  /// The parameter `listedCoin` of this provider.
  ListedCoin get listedCoin;
}

class _ListedCoinItemControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ListedCoinItemController,
          ListedCoinItemState
        >
    with ListedCoinItemControllerRef {
  _ListedCoinItemControllerProviderElement(super.provider);

  @override
  ListedCoin get listedCoin =>
      (origin as ListedCoinItemControllerProvider).listedCoin;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
