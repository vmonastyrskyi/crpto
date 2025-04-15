// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listedCoinViewModelHash() =>
    r'60c3c766545f3948515058dd850c582dc333fe45';

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

abstract class _$ListedCoinViewModel
    extends BuildlessAutoDisposeNotifier<ListedCoinState> {
  late final ListedCoin listedCoin;

  ListedCoinState build(ListedCoin listedCoin);
}

/// See also [ListedCoinViewModel].
@ProviderFor(ListedCoinViewModel)
const listedCoinViewModelProvider = ListedCoinViewModelFamily();

/// See also [ListedCoinViewModel].
class ListedCoinViewModelFamily extends Family<ListedCoinState> {
  /// See also [ListedCoinViewModel].
  const ListedCoinViewModelFamily();

  /// See also [ListedCoinViewModel].
  ListedCoinViewModelProvider call(ListedCoin listedCoin) {
    return ListedCoinViewModelProvider(listedCoin);
  }

  @override
  ListedCoinViewModelProvider getProviderOverride(
    covariant ListedCoinViewModelProvider provider,
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
  String? get name => r'listedCoinViewModelProvider';
}

/// See also [ListedCoinViewModel].
class ListedCoinViewModelProvider
    extends
        AutoDisposeNotifierProviderImpl<ListedCoinViewModel, ListedCoinState> {
  /// See also [ListedCoinViewModel].
  ListedCoinViewModelProvider(ListedCoin listedCoin)
    : this._internal(
        () => ListedCoinViewModel()..listedCoin = listedCoin,
        from: listedCoinViewModelProvider,
        name: r'listedCoinViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$listedCoinViewModelHash,
        dependencies: ListedCoinViewModelFamily._dependencies,
        allTransitiveDependencies:
            ListedCoinViewModelFamily._allTransitiveDependencies,
        listedCoin: listedCoin,
      );

  ListedCoinViewModelProvider._internal(
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
  ListedCoinState runNotifierBuild(covariant ListedCoinViewModel notifier) {
    return notifier.build(listedCoin);
  }

  @override
  Override overrideWith(ListedCoinViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ListedCoinViewModelProvider._internal(
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
  AutoDisposeNotifierProviderElement<ListedCoinViewModel, ListedCoinState>
  createElement() {
    return _ListedCoinViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListedCoinViewModelProvider &&
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
mixin ListedCoinViewModelRef
    on AutoDisposeNotifierProviderRef<ListedCoinState> {
  /// The parameter `listedCoin` of this provider.
  ListedCoin get listedCoin;
}

class _ListedCoinViewModelProviderElement
    extends
        AutoDisposeNotifierProviderElement<ListedCoinViewModel, ListedCoinState>
    with ListedCoinViewModelRef {
  _ListedCoinViewModelProviderElement(super.provider);

  @override
  ListedCoin get listedCoin =>
      (origin as ListedCoinViewModelProvider).listedCoin;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
