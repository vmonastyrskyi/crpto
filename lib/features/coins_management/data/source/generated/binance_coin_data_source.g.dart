// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_coin_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceCoinDataSource)
const binanceCoinDataSourceProvider = BinanceCoinDataSourceProvider._();

final class BinanceCoinDataSourceProvider
    extends $NotifierProvider<BinanceCoinDataSource, ICoinDataSource> {
  const BinanceCoinDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceCoinDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceCoinDataSourceHash();

  @$internal
  @override
  BinanceCoinDataSource create() => BinanceCoinDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ICoinDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ICoinDataSource>(value),
    );
  }
}

String _$binanceCoinDataSourceHash() =>
    r'c5ac3caecd75d4b64b1f5121b3df17240f509d8e';

abstract class _$BinanceCoinDataSource extends $Notifier<ICoinDataSource> {
  ICoinDataSource build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ICoinDataSource, ICoinDataSource>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ICoinDataSource, ICoinDataSource>,
              ICoinDataSource,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
