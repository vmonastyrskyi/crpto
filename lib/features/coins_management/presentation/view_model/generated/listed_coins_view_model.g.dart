// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coins_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListedCoinsViewModel)
const listedCoinsViewModelProvider = ListedCoinsViewModelProvider._();

final class ListedCoinsViewModelProvider
    extends $AsyncNotifierProvider<ListedCoinsViewModel, ListedCoinsState> {
  const ListedCoinsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listedCoinsViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listedCoinsViewModelHash();

  @$internal
  @override
  ListedCoinsViewModel create() => ListedCoinsViewModel();
}

String _$listedCoinsViewModelHash() =>
    r'09ed49159492836fa32f9da8e9615bb253c103de';

abstract class _$ListedCoinsViewModel extends $AsyncNotifier<ListedCoinsState> {
  FutureOr<ListedCoinsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ListedCoinsState>, ListedCoinsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ListedCoinsState>, ListedCoinsState>,
              AsyncValue<ListedCoinsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
