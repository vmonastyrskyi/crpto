import 'package:crpto/shared/domain/model/selected_coin.dart';

abstract interface class ISelectedCoinRepository {
  List<SelectedCoin> getSelectedCoins();

  Future<void> addSelectedCoin(SelectedCoin selectedCoin);

  Future<void> removeSelectedCoin(SelectedCoin selectedCoin);
}
