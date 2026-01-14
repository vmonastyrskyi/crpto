import 'package:crpto/features/coin_details/data/dto/order_book_dto.dart';
import 'package:crpto/features/coin_details/data/source/binance_order_book_data_source.dart';
import 'package:crpto/features/coin_details/data/source/i_order_book_data_source.dart';
import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:crpto/features/coin_details/domain/repository/i_order_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/order_book_repository.g.dart';

@riverpod
class OrderBookRepository extends _$OrderBookRepository
    implements IOrderBookRepository {
  late IOrderBookDataSource _orderBookDataSource;

  @override
  Raw<Future<IOrderBookRepository>> build() async {
    _orderBookDataSource = await ref.watch(binanceOrderBookDataSourceProvider);

    return this;
  }

  @override
  Future<OrderBook> get(String symbol, {int? limit}) async {
    final orderBookDTO = await _orderBookDataSource.get(symbol, limit: limit);

    final orderBook = OrderBookDTOMapper.toModel(orderBookDTO);

    return orderBook;
  }

  @override
  Stream<OrderBook> listen(String symbol) {
    final orderBookDTOStream = _orderBookDataSource.watch(symbol);

    final orderBookStream = orderBookDTOStream.map(OrderBookDTOMapper.toModel);

    return orderBookStream;
  }

  @override
  void unlisten(String symbol) {
    _orderBookDataSource.unwatch(symbol);
  }
}
