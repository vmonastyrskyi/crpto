import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/features/market_coins/data/repository/exchange_trading_repository.dart';
import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';
import 'package:crpto/features/market_coins/domain/repository/i_exchange_trading_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_listed_coins_use_case.g.dart';

@riverpod
class GetListedCoinsUseCase extends _$GetListedCoinsUseCase {
  late final IExchangeTradingRepository _exchangeTradingRepository;

  @override
  GetListedCoinsUseCase build() {
    _exchangeTradingRepository = ref.watch(exchangeTradingRepositoryProvider);

    return this;
  }

  Future<List<ListedCoin>> call() async {
    List<ListedCoin> listedCoins =
        (await _exchangeTradingRepository.getListedCoins())
            .where((listedCoin) => listedCoin.quoteAsset == 'USDT')
            .where((listedCoin) => listedCoin.status == 'TRADING')
            .toList();

    listedCoins = listedCoins.map(
      (listedCoin) {
        final baseAsset = listedCoin.baseAsset;

        final hasIcon = CryptoUtils.isIconExists(baseAsset);

        return listedCoin.copyWith(hasIcon: hasIcon);
      },
    ).toList();

    return listedCoins;
  }
}
