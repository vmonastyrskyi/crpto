import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coins/listed_coin/listed_coin_state.dart';
import 'package:crpto/shared/application/use_case/add_selected_coin.dart';
import 'package:crpto/shared/application/use_case/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/remove_selected_coin.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_controller.g.dart';

extension ListedCoinControllerExtension on WidgetRef {
  ListedCoinController listedCoinController(ListedCoin listedCoin) =>
      read(listedCoinControllerProvider(listedCoin).notifier);
}

@riverpod
class ListedCoinController extends _$ListedCoinController {
  late final GetSelectedCoins _getSelectedCoins;
  late final AddSelectedCoin _addSelectedCoin;
  late final RemoveSelectedCoin _removeSelectedCoin;

  @override
  ListedCoinState build(ListedCoin listedCoin) {
    _getSelectedCoins = ref.watch(getSelectedCoinsProvider);
    _addSelectedCoin = ref.watch(addSelectedCoinProvider);
    _removeSelectedCoin = ref.watch(removeSelectedCoinProvider);

    final selectedCoins = _getSelectedCoins();

    if (selectedCoins.any(
      (selectedCoin) => selectedCoin.symbol == listedCoin.symbol,
    )) {
      return ListedCoinState.initial(listedCoin: listedCoin, selected: true);
    }

    return ListedCoinState.initial(listedCoin: listedCoin);
  }

  Future<void> select(bool selected) async {
    final selectedCoin = SelectedCoin(
      symbol: listedCoin.symbol,
      baseAsset: listedCoin.baseAsset,
      quoteAsset: listedCoin.quoteAsset,
    );

    !selected
        ? await _removeSelectedCoin(selectedCoin)
        : await _addSelectedCoin(selectedCoin);

    state = state.copyWith(selected: selected);
  }
}
