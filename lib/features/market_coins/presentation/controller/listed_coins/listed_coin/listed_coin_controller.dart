import 'package:crpto/core/data/local/local_storage_with_cache.dart';
import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';
import 'package:crpto/features/market_coins/presentation/controller/listed_coins/listed_coin/listed_coin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_controller.g.dart';

extension ListedCoinControllerExtension on WidgetRef {
  ListedCoinController listedCoinController(ListedCoin listedCoin) =>
      read(listedCoinControllerProvider(listedCoin).notifier);
}

@riverpod
class ListedCoinController extends _$ListedCoinController {
  @override
  ListedCoinState build(ListedCoin listedCoin) {
    final selectedCoins =
        localStorageWithCache.get<List<String>>('selected_coins') ?? [];

    if (selectedCoins.contains(listedCoin.id)) {
      return ListedCoinState.initial(listedCoin: listedCoin, selected: true);
    }

    return ListedCoinState.initial(listedCoin: listedCoin);
  }

  Future<void> select(bool selected) async {
    final selectedCoins =
        (localStorageWithCache.get<List<String>>('selected_coins') ?? [])
            .toSet();

    !selected
        ? selectedCoins.remove(listedCoin.id)
        : selectedCoins.add(listedCoin.id);

    await localStorageWithCache.put('selected_coins', [...selectedCoins]);

    state = state.copyWith(selected: selected);
  }
}
