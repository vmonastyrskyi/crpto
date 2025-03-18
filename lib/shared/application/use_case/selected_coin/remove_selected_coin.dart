import 'package:crpto/shared/data/repository/selected_coin_repository.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:crpto/shared/domain/repository/i_selected_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/remove_selected_coin.g.dart';

@riverpod
class RemoveSelectedCoinUseCase extends _$RemoveSelectedCoinUseCase {
  late final ISelectedCoinRepository _selectedCoinRepository;

  @override
  RemoveSelectedCoinUseCase build() {
    _selectedCoinRepository = ref.watch(selectedCoinRepositoryProvider);

    return this;
  }

  Future<void> call(SelectedCoin selectedCoin) =>
      _selectedCoinRepository.remove(selectedCoin);
}
