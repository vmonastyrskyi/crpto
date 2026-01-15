// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_book_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderBookRepository)
const orderBookRepositoryProvider = OrderBookRepositoryProvider._();

final class OrderBookRepositoryProvider
    extends
        $NotifierProvider<
          OrderBookRepository,
          Raw<Future<IOrderBookRepository>>
        > {
  const OrderBookRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderBookRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderBookRepositoryHash();

  @$internal
  @override
  OrderBookRepository create() => OrderBookRepository();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Raw<Future<IOrderBookRepository>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Raw<Future<IOrderBookRepository>>>(
        value,
      ),
    );
  }
}

String _$orderBookRepositoryHash() =>
    r'ed433bb2c186e98d7d216ec3bd6261e4489d5bff';

abstract class _$OrderBookRepository
    extends $Notifier<Raw<Future<IOrderBookRepository>>> {
  Raw<Future<IOrderBookRepository>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Raw<Future<IOrderBookRepository>>,
              Raw<Future<IOrderBookRepository>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Raw<Future<IOrderBookRepository>>,
                Raw<Future<IOrderBookRepository>>
              >,
              Raw<Future<IOrderBookRepository>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
