import 'package:crpto/core/data/local/database/tables/selected_coins.dart';
import 'package:crpto/shared/data/source/drift_selected_coin_data_source.dart';
import 'package:crpto/shared/data/source/i_selected_coin_data_source.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:crpto/shared/domain/repository/i_selected_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/selected_coin_repository.g.dart';

@riverpod
class SelectedCoinRepository extends _$SelectedCoinRepository
    implements ISelectedCoinRepository {
  late final ISelectedCoinDataSource _selectedCoinDataSource;

  @override
  ISelectedCoinRepository build() {
    _selectedCoinDataSource = ref.watch(driftSelectedCoinDataSourceProvider);

    return this;
  }

  @override
  List<SelectedCoin> getSelectedCoins() {
    final selectedCoinDTOs = _selectedCoinDataSource.getAll();

    final selectedCoins =
        selectedCoinDTOs.map(SelectedCoinDTOMapper.toModel).toList();

    return selectedCoins;
  }

  @override
  Future<void> addSelectedCoin(SelectedCoin selectedCoin) {
    final selectedCoinDTO = SelectedCoinDTOMapper.fromModel(selectedCoin);

    return _selectedCoinDataSource.insert(selectedCoinDTO);
  }

  @override
  Future<void> removeSelectedCoin(SelectedCoin selectedCoin) {
    final selectedCoinDTO = SelectedCoinDTOMapper.fromModel(selectedCoin);

    return _selectedCoinDataSource.delete(selectedCoinDTO);
  }
}
