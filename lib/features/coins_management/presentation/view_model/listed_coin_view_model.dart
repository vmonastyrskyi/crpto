import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coin_state.dart';
import 'package:crpto/shared/application/use_case/selected_coin/add_selected_coin.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/remove_selected_coin.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_view_model.g.dart';

@riverpod
class ListedCoinViewModel extends _$ListedCoinViewModel {
  late GetSelectedCoinsUseCase _getSelectedCoins;
  late AddSelectedCoinUseCase _addSelectedCoin;
  late RemoveSelectedCoinUseCase _removeSelectedCoin;

  @override
  ListedCoinState build(ListedCoin listedCoin) {
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _addSelectedCoin = ref.watch(addSelectedCoinUseCaseProvider);
    _removeSelectedCoin = ref.watch(removeSelectedCoinUseCaseProvider);

    final initialState = ListedCoinState.initial(listedCoin: listedCoin);

    final selectedCoins = _getSelectedCoins();

    if (selectedCoins.any(
      (selectedCoin) => selectedCoin.symbol == listedCoin.symbol,
    )) {
      return initialState.copyWith(selected: true);
    }

    return initialState;
  }

  void select(bool selected) {
    final selectedCoin = SelectedCoin(symbol: listedCoin.symbol);

    !selected
        ? _removeSelectedCoin(selectedCoin)
        : _addSelectedCoin(selectedCoin);

    state = state.copyWith(selected: selected);
  }
}
