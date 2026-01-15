// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListedCoinViewModel)
const listedCoinViewModelProvider = ListedCoinViewModelFamily._();

final class ListedCoinViewModelProvider
    extends $NotifierProvider<ListedCoinViewModel, ListedCoinState> {
  const ListedCoinViewModelProvider._({
    required ListedCoinViewModelFamily super.from,
    required ListedCoin super.argument,
  }) : super(
         retry: null,
         name: r'listedCoinViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listedCoinViewModelHash();

  @override
  String toString() {
    return r'listedCoinViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ListedCoinViewModel create() => ListedCoinViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListedCoinState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListedCoinState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListedCoinViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listedCoinViewModelHash() =>
    r'60c3c766545f3948515058dd850c582dc333fe45';

final class ListedCoinViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ListedCoinViewModel,
          ListedCoinState,
          ListedCoinState,
          ListedCoinState,
          ListedCoin
        > {
  const ListedCoinViewModelFamily._()
    : super(
        retry: null,
        name: r'listedCoinViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListedCoinViewModelProvider call(ListedCoin listedCoin) =>
      ListedCoinViewModelProvider._(argument: listedCoin, from: this);

  @override
  String toString() => r'listedCoinViewModelProvider';
}

abstract class _$ListedCoinViewModel extends $Notifier<ListedCoinState> {
  late final _$args = ref.$arg as ListedCoin;
  ListedCoin get listedCoin => _$args;

  ListedCoinState build(ListedCoin listedCoin);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<ListedCoinState, ListedCoinState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListedCoinState, ListedCoinState>,
              ListedCoinState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
