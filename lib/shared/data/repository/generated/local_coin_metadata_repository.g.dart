// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../local_coin_metadata_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LocalCoinMetadataRepository)
const localCoinMetadataRepositoryProvider =
    LocalCoinMetadataRepositoryProvider._();

final class LocalCoinMetadataRepositoryProvider
    extends
        $NotifierProvider<
          LocalCoinMetadataRepository,
          ICoinMetadataRepository
        > {
  const LocalCoinMetadataRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localCoinMetadataRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localCoinMetadataRepositoryHash();

  @$internal
  @override
  LocalCoinMetadataRepository create() => LocalCoinMetadataRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinMetadataRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinMetadataRepository>(value),
    );
  }
}

String _$localCoinMetadataRepositoryHash() =>
    r'5f550427fbb950e575071e963a496cb7f877235a';

abstract class _$LocalCoinMetadataRepository
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
