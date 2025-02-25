// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listedCoinControllerHash() =>
    r'696e2b380b9430662e10fcd578470cb8d1734dae';

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

abstract class _$ListedCoinController
    extends BuildlessAutoDisposeNotifier<ListedCoinState> {
  late final ListedCoin listedCoin;

  ListedCoinState build(ListedCoin listedCoin);
}

/// See also [ListedCoinController].
@ProviderFor(ListedCoinController)
const listedCoinControllerProvider = ListedCoinControllerFamily();

/// See also [ListedCoinController].
class ListedCoinControllerFamily extends Family<ListedCoinState> {
  /// See also [ListedCoinController].
  const ListedCoinControllerFamily();

  /// See also [ListedCoinController].
  ListedCoinControllerProvider call(ListedCoin listedCoin) {
    return ListedCoinControllerProvider(listedCoin);
  }

  @override
  ListedCoinControllerProvider getProviderOverride(
    covariant ListedCoinControllerProvider provider,
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
  String? get name => r'listedCoinControllerProvider';
}

/// See also [ListedCoinController].
class ListedCoinControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<ListedCoinController, ListedCoinState> {
  /// See also [ListedCoinController].
  ListedCoinControllerProvider(ListedCoin listedCoin)
    : this._internal(
        () => ListedCoinController()..listedCoin = listedCoin,
        from: listedCoinControllerProvider,
        name: r'listedCoinControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$listedCoinControllerHash,
        dependencies: ListedCoinControllerFamily._dependencies,
        allTransitiveDependencies:
            ListedCoinControllerFamily._allTransitiveDependencies,
        listedCoin: listedCoin,
      );

  ListedCoinControllerProvider._internal(
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
  ListedCoinState runNotifierBuild(covariant ListedCoinController notifier) {
    return notifier.build(listedCoin);
  }

  @override
  Override overrideWith(ListedCoinController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListedCoinControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<ListedCoinController, ListedCoinState>
  createElement() {
    return _ListedCoinControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListedCoinControllerProvider &&
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
mixin ListedCoinControllerRef
    on AutoDisposeNotifierProviderRef<ListedCoinState> {
  /// The parameter `listedCoin` of this provider.
  ListedCoin get listedCoin;
}

class _ListedCoinControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          ListedCoinController,
          ListedCoinState
        >
    with ListedCoinControllerRef {
  _ListedCoinControllerProviderElement(super.provider);

  @override
  ListedCoin get listedCoin =>
      (origin as ListedCoinControllerProvider).listedCoin;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
