import 'package:collection/collection.dart';
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
  late ICoinRepository _coinRepository;
  late ICoinMetadataRepository _coinMetadataRepository;

  @override
  GetListedCoinsUseCase build() {
    _coinRepository = ref.watch(coinRepositoryProvider);
    _coinMetadataRepository = ref.watch(coinMetadataRepositoryProvider);

    return this;
  }

  Future<List<ListedCoin>> call() async {
    final listedCoins = await _coinRepository.getListedCoins();

    List<ListedCoin> filteredListedCoins = [
      ...listedCoins
          .where((listedCoin) => listedCoin.quoteAsset == 'USDT')
          .where(
            (listedCoin) => CryptoUtils.isIconExists(listedCoin.baseAsset),
          ),
    ];
    final groupedListedCoins = listedCoins.groupFoldBy<String, Set<String>>(
      (listedCoin) => listedCoin.baseAsset,
      (previous, listedCoin) {
        return (previous ?? <String>{})..add(listedCoin.symbol);
      },
    );

    final coinsMetadata = [
      ...filteredListedCoins.map((filteredListedCoin) {
        final symbol = filteredListedCoin.symbol;
        final baseAsset = filteredListedCoin.baseAsset;
        final quoteAsset = filteredListedCoin.quoteAsset;
        final displayName = CryptoUtils.getDisplayName(baseAsset);
        final status = filteredListedCoin.status;

        final relatedSymbols = [
          ...?groupedListedCoins[baseAsset]?..remove(symbol),
        ];

        return CoinMetadata(
          symbol: symbol,
          baseAsset: baseAsset,
          quoteAsset: quoteAsset,
          displayName: displayName,
          status: status,
          relatedSymbols: relatedSymbols,
        );
      }),
    ];

    await _coinMetadataRepository.addAll(coinsMetadata);

    filteredListedCoins = [
      ...filteredListedCoins.where(
        (filteredListedCoin) => filteredListedCoin.status == 'TRADING',
      ),
    ];

    return filteredListedCoins;
  }
}
