import 'package:crpto/features/coin_details/data/repository/order_book_repository.dart';
import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:crpto/features/coin_details/domain/repository/i_order_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_order_book.g.dart';

@riverpod
class GetOrderBookUseCase extends _$GetOrderBookUseCase {
  late IOrderBookRepository _orderBookRepository;

  @override
  Raw<Future<GetOrderBookUseCase>> build() async {
    _orderBookRepository = await ref.watch(orderBookRepositoryProvider);

    return this;
  }

  Future<OrderBook> call(String symbol, {int limit = 5000}) =>
      _orderBookRepository.get(symbol, limit: limit);
}
