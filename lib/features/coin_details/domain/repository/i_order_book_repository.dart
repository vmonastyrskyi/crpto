import 'package:crpto/features/coin_details/domain/model/order_book.dart';

abstract interface class IOrderBookRepository {
  Future<OrderBook> get(String symbol, {int? limit});

  Stream<OrderBook> listen(String symbol);

  void unlisten(String symbol);
}
