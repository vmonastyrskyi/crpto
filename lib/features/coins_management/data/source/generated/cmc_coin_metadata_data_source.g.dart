// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cmc_coin_metadata_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CmcCoinMetadataDataSource)
const cmcCoinMetadataDataSourceProvider = CmcCoinMetadataDataSourceProvider._();

final class CmcCoinMetadataDataSourceProvider
    extends
        $NotifierProvider<CmcCoinMetadataDataSource, ICoinMetadataDataSource> {
  const CmcCoinMetadataDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cmcCoinMetadataDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cmcCoinMetadataDataSourceHash();

  @$internal
  @override
  CmcCoinMetadataDataSource create() => CmcCoinMetadataDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinMetadataDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinMetadataDataSource>(value),
    );
  }
}

String _$cmcCoinMetadataDataSourceHash() =>
    r'54be778a5e05b821f4245bc0db4da780ff50aaee';

abstract class _$CmcCoinMetadataDataSource
    extends $Notifier<ICoinMetadataDataSource> {
  ICoinMetadataDataSource build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ICoinMetadataDataSource, ICoinMetadataDataSource>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ICoinMetadataDataSource, ICoinMetadataDataSource>,
              ICoinMetadataDataSource,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
