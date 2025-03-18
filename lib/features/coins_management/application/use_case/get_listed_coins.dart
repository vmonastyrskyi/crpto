import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/features/coins_management/data/repository/coin_repository.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_repository.dart';
import 'package:crpto/shared/data/repository/coin_metadata_repository.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/repository/i_coin_metadata_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_listed_coins.g.dart';

@riverpod
class GetListedCoinsUseCase extends _$GetListedCoinsUseCase {
  late final ICoinRepository _coinRepository;
  late final ICoinMetadataRepository _coinMetadataRepository;

  @override
  GetListedCoinsUseCase build() {
    _coinRepository = ref.watch(coinRepositoryProvider);
    _coinMetadataRepository = ref.watch(coinMetadataRepositoryProvider);

    return this;
  }

  Future<List<ListedCoin>> call() async {
    List<ListedCoin> listedCoinList =
        (await _coinRepository.getListedCoins())
            .where((listedCoin) => listedCoin.quoteAsset == 'USDT')
            .where(
              (listedCoin) => CryptoUtils.isIconExists(listedCoin.baseAsset),
            )
            .toList();

    final coinMetadataList =
        listedCoinList.map((listedCoin) {
          final symbol = listedCoin.symbol;
          final baseAsset = listedCoin.baseAsset;
          final quoteAsset = listedCoin.quoteAsset;
          final displayName = CryptoUtils.getDisplayName(baseAsset);
          final hasIcon = CryptoUtils.isIconExists(baseAsset);
          final status = listedCoin.status;

          return CoinMetadata(
            symbol: symbol,
            baseAsset: baseAsset,
            quoteAsset: quoteAsset,
            displayName: displayName,
            hasIcon: true,
            status: status,
          );
        }).toList();

    await _coinMetadataRepository.addAll(coinMetadataList);

    listedCoinList =
        listedCoinList
            .where((listedCoin) => listedCoin.status == 'TRADING')
            .toList();

    return listedCoinList;
  }
}
