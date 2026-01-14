import 'dart:async';

import 'package:crpto/features/coin_details/application/use_case/get_order_book.dart';
import 'package:crpto/features/coin_details/application/use_case/listen_order_book.dart';
import 'package:crpto/features/coin_details/application/use_case/unlisten_order_book.dart';
import 'package:crpto/features/coin_details/domain/model/aggregated_order_book.dart';
import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:crpto/features/coin_details/domain/service/order_book_aggregator.dart';
import 'package:crpto/features/coin_details/domain/service/order_book_diff_applier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/order_book_notifier.g.dart';

@riverpod
class OrderBookNotifier extends _$OrderBookNotifier {
  final List<OrderBook> _buffer = [];

  StreamSubscription<OrderBook>? _orderBookStreamSubscription;
  OrderBook? _rawOrderBook;
  int? _localLastUpdateId;

  late GetOrderBookUseCase _getOrderBook;
  late ListenOrderBookUseCase _listenOrderBook;
  late UnlistenOrderBookUseCase _unlistenOrderBook;

  late OrderBookDiffApplier _diffApplier;
  late OrderBookAggregator _aggregator;

  @override
  Future<AggregatedOrderBook> build(String symbol) async {
    _getOrderBook = await ref.watch(getOrderBookUseCaseProvider);
    _listenOrderBook = await ref.watch(listenOrderBookUseCaseProvider);
    _unlistenOrderBook = await ref.watch(unlistenOrderBookUseCaseProvider);

    _diffApplier = ref.watch(orderBookDiffApplierProvider);
    _aggregator = ref.watch(orderBookAggregatorProvider);

    ref.onDispose(() => _orderBookStreamSubscription?.cancel());
    ref.onDispose(() => _unlistenOrderBook(symbol));

    await _loadOrderBook();

    return await future;
  }

  Future<void> _loadOrderBook() async {
    final orderBook = await _getOrderBook(symbol);

    _localLastUpdateId = orderBook.lastUpdateId;

    state = AsyncData(_aggregate(_rawOrderBook = orderBook));

    _orderBookStreamSubscription = _listenOrderBook(symbol).listen((orderBook) {
      _buffer.add(orderBook);

      _applyBuffer();
    });
  }

  void _applyBuffer() {
    if (_buffer.isEmpty || _localLastUpdateId == null) return;

    while (_buffer.isNotEmpty) {
      final diff = _buffer.first;

      final firstU = diff.firstUpdateId;
      final finalU = diff.lastUpdateId;

      // Case 1: Event is too old → discard
      if (finalU <= _localLastUpdateId!) {
        _buffer.removeAt(0);

        continue;
      }

      // Case 2: Gap detected → restart everything
      if (firstU != null && firstU > _localLastUpdateId! + 1) {
        _buffer.clear();

        if (ref.mounted) ref.invalidateSelf();

        return;
      }

      // Case 3: Valid next event → apply
      final updatedOrderBook = _diffApplier.apply(
        current: _rawOrderBook!,
        diff: diff,
      );

      state = AsyncData(_aggregate(_rawOrderBook = updatedOrderBook));

      _localLastUpdateId = finalU;

      _buffer.removeAt(0);
    }
  }

  AggregatedOrderBook _aggregate(OrderBook book) {
    final aggregatedBids = _aggregator.aggregate(
      levels: book.bids,
      step: 0.01,
      isBid: true,
      limit: 33,
    );
    final aggregatedAsks = _aggregator.aggregate(
      levels: book.asks,
      step: 0.01,
      isBid: false,
      limit: 33,
    );

    return AggregatedOrderBook(bids: aggregatedBids, asks: aggregatedAsks);
  }
}
