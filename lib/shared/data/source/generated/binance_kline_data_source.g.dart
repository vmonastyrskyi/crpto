// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_kline_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceKlineDataSource)
const binanceKlineDataSourceProvider = BinanceKlineDataSourceProvider._();

final class BinanceKlineDataSourceProvider
    extends $NotifierProvider<BinanceKlineDataSource, IKlineDataSource> {
  const BinanceKlineDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceKlineDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceKlineDataSourceHash();

  @$internal
  @override
  BinanceKlineDataSource create() => BinanceKlineDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IKlineDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IKlineDataSource>(value),
    );
  }
}

String _$binanceKlineDataSourceHash() =>
    r'27b01360a57102de027c0cd21c9cb2e9576d286d';

abstract class _$BinanceKlineDataSource extends $Notifier<IKlineDataSource> {
  IKlineDataSource build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<IKlineDataSource, IKlineDataSource>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<IKlineDataSource, IKlineDataSource>,
              IKlineDataSource,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
