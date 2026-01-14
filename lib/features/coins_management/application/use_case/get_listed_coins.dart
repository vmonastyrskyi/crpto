import 'package:crpto/features/coins_management/data/repository/binance_coin_repository.dart';
import 'package:crpto/features/coins_management/data/repository/cmc_coin_metadata_repository.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/domain/repository/i_coin_metadata_repository.dart'
    as cmc;
import 'package:crpto/features/coins_management/domain/repository/i_coin_repository.dart';
import 'package:crpto/shared/data/repository/local_coin_metadata_repository.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/model/enum/coin_status.dart';
import 'package:crpto/shared/domain/repository/i_coin_metadata_repository.dart'
    as local;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_listed_coins.g.dart';

@riverpod
class GetListedCoinsUseCase extends _$GetListedCoinsUseCase {
  late ICoinRepository _binanceCoinRepository;
  late local.ICoinMetadataRepository _localCoinMetadataRepository;
  late cmc.ICoinMetadataRepository _cmcCoinMetadataRepository;

  @override
  GetListedCoinsUseCase build() {
    _binanceCoinRepository = ref.watch(binanceCoinRepositoryProvider);
    _localCoinMetadataRepository = ref.watch(
      localCoinMetadataRepositoryProvider,
    );
    _cmcCoinMetadataRepository = ref.watch(cmcCoinMetadataRepositoryProvider);

    return this;
  }

  Future<List<ListedCoin>> call() async {
    List<ListedCoin> listedCoins = await _binanceCoinRepository
        .getListedCoins();

    listedCoins = [
      ...listedCoins.where((listedCoin) {
        return RegExp(r'^[A-Z0-9]+$').hasMatch(listedCoin.symbol) &&
            listedCoin.status == CoinStatus.trading &&
            listedCoin.quoteAsset == 'USDT';
      }),
    ];

    Set<String> baseAssets = {
      ...listedCoins.map((listedCoin) => listedCoin.baseAsset),
    };

    final cmcCoinsMetadata = await _cmcCoinMetadataRepository.getCoinsMetadata(
      baseAssets,
    );

    baseAssets = {...cmcCoinsMetadata.keys};

    final cmcCoinsId = await _cmcCoinMetadataRepository.getCoinsId(baseAssets);

    final listedCoinsMetadata = <ListedCoin, CoinMetadata>{};

    for (final listedCoin in listedCoins) {
      final baseAsset = listedCoin.baseAsset;

      if (!baseAssets.contains(baseAsset)) continue;

      final cmcCoinMetadata = cmcCoinsMetadata[baseAsset];

      if (cmcCoinMetadata == null) continue;

      final cmcCoinId = cmcCoinsId[baseAsset];

      if (cmcCoinId == null) continue;

      final id = cmcCoinMetadata.id;
      final symbol = listedCoin.symbol;
      final quoteAsset = listedCoin.quoteAsset;
      final tickSize = listedCoin.tickSize;
      final stepSize = listedCoin.stepSize;
      final slug = cmcCoinMetadata.slug;
      final name = cmcCoinMetadata.name;
      final description = cmcCoinMetadata.description;
      final category = cmcCoinMetadata.category;
      final logo = cmcCoinMetadata.logo;
      final dateAdded = cmcCoinMetadata.dateAdded;
      final rank = cmcCoinId.rank ?? -1;

      listedCoinsMetadata[listedCoin] = CoinMetadata(
        id: id,
        symbol: symbol,
        baseAsset: baseAsset,
        quoteAsset: quoteAsset,
        tickSize: tickSize,
        stepSize: stepSize,
        slug: slug,
        name: name,
        description: description,
        category: category,
        logo: logo,
        dateAdded: dateAdded,
        rank: rank,
      );
    }

    final coinsMetadata = [...listedCoinsMetadata.values];

    await _localCoinMetadataRepository.addAll(coinsMetadata);

    listedCoins = [...listedCoinsMetadata.keys];

    return listedCoins;
  }
}
