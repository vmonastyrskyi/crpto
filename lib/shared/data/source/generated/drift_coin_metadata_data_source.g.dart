// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../drift_coin_metadata_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DriftCoinMetadataDataSource)
const driftCoinMetadataDataSourceProvider =
    DriftCoinMetadataDataSourceProvider._();

final class DriftCoinMetadataDataSourceProvider
    extends
        $NotifierProvider<
          DriftCoinMetadataDataSource,
          ICoinMetadataDataSource
        > {
  const DriftCoinMetadataDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driftCoinMetadataDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driftCoinMetadataDataSourceHash();

  @$internal
  @override
  DriftCoinMetadataDataSource create() => DriftCoinMetadataDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinMetadataDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinMetadataDataSource>(value),
    );
  }
}

String _$driftCoinMetadataDataSourceHash() =>
    r'6ba78596a1219feb7dfda25804418eb0bad95da1';

abstract class _$DriftCoinMetadataDataSource
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
