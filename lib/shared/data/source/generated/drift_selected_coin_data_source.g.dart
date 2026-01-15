// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../drift_selected_coin_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DriftSelectedCoinDataSource)
const driftSelectedCoinDataSourceProvider =
    DriftSelectedCoinDataSourceProvider._();

final class DriftSelectedCoinDataSourceProvider
    extends
        $NotifierProvider<
          DriftSelectedCoinDataSource,
          ISelectedCoinDataSource
        > {
  const DriftSelectedCoinDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'driftSelectedCoinDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$driftSelectedCoinDataSourceHash();

  @$internal
  @override
  DriftSelectedCoinDataSource create() => DriftSelectedCoinDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ISelectedCoinDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ISelectedCoinDataSource>(value),
    );
  }
}

String _$driftSelectedCoinDataSourceHash() =>
    r'54604c5a1e738e3e3053a08ef0cde05f8464df4c';

abstract class _$DriftSelectedCoinDataSource
    extends $Notifier<ISelectedCoinDataSource> {
  ISelectedCoinDataSource build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ISelectedCoinDataSource, ISelectedCoinDataSource>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ISelectedCoinDataSource, ISelectedCoinDataSource>,
              ISelectedCoinDataSource,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
