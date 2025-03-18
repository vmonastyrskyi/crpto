import 'package:crpto/shared/data/repository/selected_coin_repository.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:crpto/shared/domain/repository/i_selected_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listen_selected_coins.g.dart';

@riverpod
class ListenSelectedCoinsUseCase extends _$ListenSelectedCoinsUseCase {
  late final ISelectedCoinRepository _selectedCoinRepository;

  @override
  ListenSelectedCoinsUseCase build() {
    _selectedCoinRepository = ref.watch(selectedCoinRepositoryProvider);

    return this;
  }

  Stream<List<SelectedCoin>> call({bool getOnWatch = false}) =>
      _selectedCoinRepository.listen(getOnWatch: getOnWatch);
}
