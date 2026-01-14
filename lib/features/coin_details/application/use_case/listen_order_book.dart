import 'package:crpto/features/coin_details/data/repository/order_book_repository.dart';
import 'package:crpto/features/coin_details/domain/model/order_book.dart';
import 'package:crpto/features/coin_details/domain/repository/i_order_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listen_order_book.g.dart';

@riverpod
class ListenOrderBookUseCase extends _$ListenOrderBookUseCase {
  late IOrderBookRepository _orderBookRepository;

  @override
  Raw<Future<ListenOrderBookUseCase>> build() async {
    _orderBookRepository = await ref.watch(orderBookRepositoryProvider);

    return this;
  }

  Stream<OrderBook> call(String symbol) => _orderBookRepository.listen(symbol);
}
