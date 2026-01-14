// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_book_aggregator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderBookAggregator)
const orderBookAggregatorProvider = OrderBookAggregatorProvider._();

final class OrderBookAggregatorProvider
    extends $NotifierProvider<OrderBookAggregator, OrderBookAggregator> {
  const OrderBookAggregatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderBookAggregatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderBookAggregatorHash();

  @$internal
  @override
  OrderBookAggregator create() => OrderBookAggregator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderBookAggregator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderBookAggregator>(value),
    );
  }
}

String _$orderBookAggregatorHash() =>
    r'c926358c1c5fda5ef972de51eefe926a40ae30d7';

abstract class _$OrderBookAggregator extends $Notifier<OrderBookAggregator> {
  OrderBookAggregator build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrderBookAggregator, OrderBookAggregator>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderBookAggregator, OrderBookAggregator>,
              OrderBookAggregator,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
