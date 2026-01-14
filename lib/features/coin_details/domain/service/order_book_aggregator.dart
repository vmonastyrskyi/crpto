import 'package:crpto/features/coin_details/domain/model/order_book_level.dart';
import 'package:crpto/features/coin_details/domain/model/order_book_level_depth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/order_book_aggregator.g.dart';

@riverpod
class OrderBookAggregator extends _$OrderBookAggregator {
  @override
  OrderBookAggregator build() => this;

  List<OrderBookLevelDepth> aggregate({
    required List<OrderBookLevel> levels,
    required double step,
    required bool isBid,
    required int limit,
  }) {
    final result = <OrderBookLevelDepth>[];

    double? currentPrice;
    double currentQuantity = 0.0;
    double cumulative = 0.0;

    for (final level in levels) {
      final rounded = _roundPrice(level.price, step, isBid);

      if (currentPrice == rounded) {
        currentQuantity += level.quantity;
        continue;
      }

      // flush previous bucket
      if (currentPrice != null) {
        cumulative += currentQuantity;

        result.add(
          OrderBookLevelDepth(
            level: OrderBookLevel(
              price: currentPrice,
              quantity: currentQuantity,
            ),
            depth: cumulative,
          ),
        );

        if (result.length == limit + 1) break;
      }

      currentPrice = rounded;
      currentQuantity = level.quantity;
    }

    // flush last
    if (currentPrice != null && result.length < limit + 1) {
      cumulative += currentQuantity;

      result.add(
        OrderBookLevelDepth(
          level: OrderBookLevel(price: currentPrice, quantity: currentQuantity),
          depth: cumulative,
        ),
      );
    }

    return result;
  }

  double _roundPrice(double price, double step, bool isBid) {
    final factor = price / step;

    return isBid ? (factor.floor() * step) : (factor.ceil() * step);
  }
}
