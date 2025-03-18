import 'package:crpto/shared/data/repository/selected_coin_repository.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:crpto/shared/domain/repository/i_selected_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_selected_coins.g.dart';

@riverpod
class GetSelectedCoinsUseCase extends _$GetSelectedCoinsUseCase {
  late final ISelectedCoinRepository _selectedCoinRepository;

  @override
  GetSelectedCoinsUseCase build() {
    _selectedCoinRepository = ref.watch(selectedCoinRepositoryProvider);

    return this;
  }

  List<SelectedCoin> call() => _selectedCoinRepository.getAll();
}
