import 'package:crpto/features/coins_management/data/dto/listed_coin_dto.dart';

abstract interface class ICoinDataSource {
  Future<List<ListedCoinDTO>> getListedCoins();
}
