// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_trade_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceTradeDataSource)
const binanceTradeDataSourceProvider = BinanceTradeDataSourceProvider._();

final class BinanceTradeDataSourceProvider
    extends
        $NotifierProvider<
          BinanceTradeDataSource,
          Raw<Future<ITradeDataSource>>
        > {
  const BinanceTradeDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceTradeDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceTradeDataSourceHash();

  @$internal
  @override
  BinanceTradeDataSource create() => BinanceTradeDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<ITradeDataSource>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<ITradeDataSource>>>(
        value,
      ),
    );
  }
}

String _$binanceTradeDataSourceHash() =>
    r'812ce717e815f8a4095525fcb24251a89de4fa1b';

abstract class _$BinanceTradeDataSource
    extends $Notifier<Raw<Future<ITradeDataSource>>> {
  Raw<Future<ITradeDataSource>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<ITradeDataSource>>,
              Raw<Future<ITradeDataSource>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<ITradeDataSource>>,
                Raw<Future<ITradeDataSource>>
              >,
              Raw<Future<ITradeDataSource>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
