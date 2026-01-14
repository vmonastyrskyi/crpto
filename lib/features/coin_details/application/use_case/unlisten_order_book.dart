import 'package:crpto/features/coin_details/data/repository/order_book_repository.dart';
import 'package:crpto/features/coin_details/domain/repository/i_order_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/unlisten_order_book.g.dart';

@riverpod
class UnlistenOrderBookUseCase extends _$UnlistenOrderBookUseCase {
  late IOrderBookRepository _orderBookRepository;

  @override
  Raw<Future<UnlistenOrderBookUseCase>> build() async {
    _orderBookRepository = await ref.watch(orderBookRepositoryProvider);

    return this;
  }

  void call(String symbol) => _orderBookRepository.unlisten(symbol);
}
