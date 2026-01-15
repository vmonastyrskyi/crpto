// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_ticker_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceTickerDataSource)
const binanceTickerDataSourceProvider = BinanceTickerDataSourceProvider._();

final class BinanceTickerDataSourceProvider
    extends
        $NotifierProvider<
          BinanceTickerDataSource,
          Raw<Future<ITickerDataSource>>
        > {
  const BinanceTickerDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceTickerDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceTickerDataSourceHash();

  @$internal
  @override
  BinanceTickerDataSource create() => BinanceTickerDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ITickerDataSource>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<ITickerDataSource>>>(
        value,
      ),
    );
  }
}

String _$binanceTickerDataSourceHash() =>
    r'9b51d2e64d280b76d73340278b95708027cd9c84';

abstract class _$BinanceTickerDataSource
    extends $Notifier<Raw<Future<ITickerDataSource>>> {
  Raw<Future<ITickerDataSource>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ITickerDataSource>>,
              Raw<Future<ITickerDataSource>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ITickerDataSource>>,
                Raw<Future<ITickerDataSource>>
              >,
              Raw<Future<ITickerDataSource>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
