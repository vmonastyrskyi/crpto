// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cmc_coin_metadata_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CmcCoinMetadataRepository)
const cmcCoinMetadataRepositoryProvider = CmcCoinMetadataRepositoryProvider._();

final class CmcCoinMetadataRepositoryProvider
    extends
        $NotifierProvider<CmcCoinMetadataRepository, ICoinMetadataRepository> {
  const CmcCoinMetadataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cmcCoinMetadataRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cmcCoinMetadataRepositoryHash();

  @$internal
  @override
  CmcCoinMetadataRepository create() => CmcCoinMetadataRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinMetadataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinMetadataRepository>(value),
    );
  }
}

String _$cmcCoinMetadataRepositoryHash() =>
    r'cd67c48f719feff090d79e42c949220a4433e019';

abstract class _$CmcCoinMetadataRepository
    extends $Notifier<ICoinMetadataRepository> {
  ICoinMetadataRepository build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ICoinMetadataRepository, ICoinMetadataRepository>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ICoinMetadataRepository, ICoinMetadataRepository>,
              ICoinMetadataRepository,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
