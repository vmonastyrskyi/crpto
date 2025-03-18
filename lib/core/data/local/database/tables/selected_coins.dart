import 'package:crpto/core/data/local/database/database.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:drift/drift.dart';
import 'package:rxdart/rxdart.dart';

@DataClassName('SelectedCoinDTO')
class SelectedCoins extends Table {
  final Set<SelectedCoinDTO> _cache = {};

  late final Column<String> symbol = text()();

  @override
  Set<Column<Object>> get primaryKey => {symbol};

  Future<void> loadCache() async {
    _cache
      ..clear()
      ..addAll(await crptoDB.selectedCoins.select().get());
  }

  List<SelectedCoinDTO> getAll() => [..._cache];

  Future<int> insert(SelectedCoinDTO selectedCoinDTO) {
    _cache.add(selectedCoinDTO);

    return crptoDB.selectedCoins.insertOnConflictUpdate(selectedCoinDTO);
  }

  Future<int> delete(SelectedCoinDTO selectedCoinDTO) {
    _cache.removeWhere((e) => e.symbol == selectedCoinDTO.symbol);

    return crptoDB.selectedCoins.deleteWhere(
      (e) => e.symbol.equals(selectedCoinDTO.symbol),
    );
  }

  Stream<List<SelectedCoinDTO>> watch({required bool getOnWatch}) async* {
    if (getOnWatch) {
      yield await crptoDB.selectedCoins.select(distinct: true).get();
    }

    final insertStream = crptoDB.tableUpdates(
      TableUpdateQuery.onTable(
        limitUpdateKind: UpdateKind.insert,
        crptoDB.selectedCoins,
      ),
    );

    final updateStream = crptoDB.tableUpdates(
      TableUpdateQuery.onTable(
        limitUpdateKind: UpdateKind.update,
        crptoDB.selectedCoins,
      ),
    );

    final deleteStream = crptoDB.tableUpdates(
      TableUpdateQuery.onTable(
        limitUpdateKind: UpdateKind.delete,
        crptoDB.selectedCoins,
      ),
    );

    final combinedStream = Rx.merge([insertStream, updateStream, deleteStream]);

    await for (final _ in combinedStream) {
      yield await crptoDB.selectedCoins.select(distinct: true).get();
    }
  }
}

extension SelectedCoinDTOMapper on SelectedCoinDTO {
  static SelectedCoinDTO fromModel(SelectedCoin selectedCoin) {
    return SelectedCoinDTO(symbol: selectedCoin.symbol);
  }

  static SelectedCoin toModel(SelectedCoinDTO selectedCoinDTO) {
    return SelectedCoin(symbol: selectedCoinDTO.symbol);
  }
}
