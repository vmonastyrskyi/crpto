import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/order_book_diff_applier.g.dart';

@riverpod
class OrderBookDiffApplier extends _$OrderBookDiffApplier {
  @override
  OrderBookDiffApplier build() => this;

  OrderBook apply({required OrderBook current, required OrderBook diff}) {
    final bidsMap = {for (final bid in current.bids) bid.price: bid};
    final asksMap = {for (final ask in current.asks) ask.price: ask};

    for (final bid in diff.bids) {
      bid.quantity > 0 ? bidsMap[bid.price] = bid : bidsMap.remove(bid.price);
    }

    for (final ask in diff.asks) {
      ask.quantity > 0 ? asksMap[ask.price] = ask : asksMap.remove(ask.price);
    }

    return OrderBook(
      bids: bidsMap.values.toList()..sort((a, b) => b.price.compareTo(a.price)),
      asks: asksMap.values.toList()..sort((a, b) => a.price.compareTo(b.price)),
      lastUpdateId: diff.lastUpdateId,
    );
  }
}
