import 'package:crpto/features/coin_details/data/dto/order_book_dto.dart';

abstract interface class IOrderBookDataSource {
  Future<OrderBookDTO> get(String symbol, {int? limit});

  Stream<OrderBookDTO> watch(String symbol);

  void unwatch(String symbol);
}
