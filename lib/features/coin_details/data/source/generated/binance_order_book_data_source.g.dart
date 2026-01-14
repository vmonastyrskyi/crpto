// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../binance_order_book_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BinanceOrderBookDataSource)
const binanceOrderBookDataSourceProvider =
    BinanceOrderBookDataSourceProvider._();

final class BinanceOrderBookDataSourceProvider
    extends
        $NotifierProvider<
          BinanceOrderBookDataSource,
          Raw<Future<IOrderBookDataSource>>
        > {
  const BinanceOrderBookDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'binanceOrderBookDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$binanceOrderBookDataSourceHash();

  @$internal
  @override
  BinanceOrderBookDataSource create() => BinanceOrderBookDataSource();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<IOrderBookDataSource>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<IOrderBookDataSource>>>(
        value,
      ),
    );
  }
}

String _$binanceOrderBookDataSourceHash() =>
    r'6617e69456f48d7493523873524d0b7976dc26a2';

abstract class _$BinanceOrderBookDataSource
    extends $Notifier<Raw<Future<IOrderBookDataSource>>> {
  Raw<Future<IOrderBookDataSource>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<IOrderBookDataSource>>,
              Raw<Future<IOrderBookDataSource>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<IOrderBookDataSource>>,
                Raw<Future<IOrderBookDataSource>>
              >,
              Raw<Future<IOrderBookDataSource>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
