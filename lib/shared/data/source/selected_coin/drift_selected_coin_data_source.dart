import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/data/source/selected_coin/i_selected_coin_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/drift_selected_coin_data_source.g.dart';

@riverpod
class DriftSelectedCoinDataSource extends _$DriftSelectedCoinDataSource
    implements ISelectedCoinDataSource {
  @override
  ISelectedCoinDataSource build() => this;

  @override
  List<SelectedCoinDTO> getAll() => crptoDB.selectedCoins.getAll();

  @override
  Future<void> insert(SelectedCoinDTO selectedCoinDTO) =>
      crptoDB.selectedCoins.insert(selectedCoinDTO);

  @override
  Future<void> delete(SelectedCoinDTO selectedCoinDTO) =>
      crptoDB.selectedCoins.delete(selectedCoinDTO);
}
