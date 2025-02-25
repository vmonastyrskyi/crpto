import 'package:crpto/core/data/local/database/database.dart';

abstract interface class ISelectedCoinDataSource {
  List<SelectedCoinDTO> getAll();

  Future<void> insert(SelectedCoinDTO selectedCoinDTO);

  Future<void> delete(SelectedCoinDTO selectedCoinDTO);
}
