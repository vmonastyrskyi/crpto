// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_book_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderBookNotifier)
const orderBookProvider = OrderBookNotifierFamily._();

final class OrderBookNotifierProvider
    extends $AsyncNotifierProvider<OrderBookNotifier, AggregatedOrderBook> {
  const OrderBookNotifierProvider._({
    required OrderBookNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderBookProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderBookNotifierHash();

  @override
  String toString() {
    return r'orderBookProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrderBookNotifier create() => OrderBookNotifier();

  @override
  bool operator ==(Object other) {
    return other is OrderBookNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderBookNotifierHash() => r'afea879b767c3e2ddfbde25c3f73b8ae1c97752d';

final class OrderBookNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          OrderBookNotifier,
          AsyncValue<AggregatedOrderBook>,
          AggregatedOrderBook,
          FutureOr<AggregatedOrderBook>,
          String
        > {
  const OrderBookNotifierFamily._()
    : super(
        retry: null,
        name: r'orderBookProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderBookNotifierProvider call(String symbol) =>
      OrderBookNotifierProvider._(argument: symbol, from: this);

  @override
  String toString() => r'orderBookProvider';
}

abstract class _$OrderBookNotifier extends $AsyncNotifier<AggregatedOrderBook> {
  late final _$args = ref.$arg as String;
  String get symbol => _$args;

  FutureOr<AggregatedOrderBook> build(String symbol);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<AggregatedOrderBook>, AggregatedOrderBook>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AggregatedOrderBook>, AggregatedOrderBook>,
              AsyncValue<AggregatedOrderBook>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
