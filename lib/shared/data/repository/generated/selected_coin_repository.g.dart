// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../selected_coin_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedCoinRepository)
const selectedCoinRepositoryProvider = SelectedCoinRepositoryProvider._();

final class SelectedCoinRepositoryProvider
    extends $NotifierProvider<SelectedCoinRepository, ISelectedCoinRepository> {
  const SelectedCoinRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCoinRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCoinRepositoryHash();

  @$internal
  @override
  SelectedCoinRepository create() => SelectedCoinRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ISelectedCoinRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ISelectedCoinRepository>(value),
    );
  }
}

String _$selectedCoinRepositoryHash() =>
    r'926adcd2802b51039ed665fd011ffa69dd20ba32';

abstract class _$SelectedCoinRepository
    extends $Notifier<ISelectedCoinRepository> {
  ISelectedCoinRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ISelectedCoinRepository, ISelectedCoinRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ISelectedCoinRepository, ISelectedCoinRepository>,
              ISelectedCoinRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
