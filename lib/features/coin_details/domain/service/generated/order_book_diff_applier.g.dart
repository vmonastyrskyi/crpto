// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_book_diff_applier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderBookDiffApplier)
const orderBookDiffApplierProvider = OrderBookDiffApplierProvider._();

final class OrderBookDiffApplierProvider
    extends $NotifierProvider<OrderBookDiffApplier, OrderBookDiffApplier> {
  const OrderBookDiffApplierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderBookDiffApplierProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderBookDiffApplierHash();

  @$internal
  @override
  OrderBookDiffApplier create() => OrderBookDiffApplier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderBookDiffApplier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderBookDiffApplier>(value),
    );
  }
}

String _$orderBookDiffApplierHash() =>
    r'e4fe3b43dab778f465b7b3c1e6ade7ced11e5a9b';

abstract class _$OrderBookDiffApplier extends $Notifier<OrderBookDiffApplier> {
  OrderBookDiffApplier build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrderBookDiffApplier, OrderBookDiffApplier>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderBookDiffApplier, OrderBookDiffApplier>,
              OrderBookDiffApplier,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
