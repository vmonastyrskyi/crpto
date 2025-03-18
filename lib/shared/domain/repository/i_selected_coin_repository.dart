import 'package:crpto/shared/domain/model/selected_coin.dart';

abstract interface class ISelectedCoinRepository {
  List<SelectedCoin> getAll();

  Future<void> add(SelectedCoin selectedCoin);

  Future<void> remove(SelectedCoin selectedCoin);

  Stream<List<SelectedCoin>> listen({required bool getOnWatch});
}
