import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/features/coins_management/data/repository/coin_repository.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_listed_coins_use_case.g.dart';

@riverpod
class GetListedCoinsUseCase extends _$GetListedCoinsUseCase {
  late final ICoinRepository _exchangeTradingRepository;

  @override
  GetListedCoinsUseCase build() {
    _exchangeTradingRepository = ref.watch(coinRepositoryProvider);

    return this;
  }

  Future<List<ListedCoin>> call() async {
    List<ListedCoin> listedCoins =
        (await _exchangeTradingRepository.getListedCoins())
            .where((listedCoin) => listedCoin.quoteAsset == 'USDT')
            .where((listedCoin) => listedCoin.status == 'TRADING')
            .toList();

    listedCoins =
        listedCoins.map((listedCoin) {
          final baseAsset = listedCoin.baseAsset;

          final hasIcon = CryptoUtils.isIconExists(baseAsset);

          return listedCoin.copyWith(hasIcon: hasIcon);
        }).toList();

    return listedCoins;
  }
}
