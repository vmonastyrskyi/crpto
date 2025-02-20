import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';

abstract interface class ICoinRepository {
  Future<List<ListedCoin>> getListedCoins();
}
