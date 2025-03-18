import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coin_item/listed_coin_item_state.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/application/use_case/selected_coin/add_selected_coin.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/remove_selected_coin.dart';
import 'package:crpto/shared/domain/model/selected_coin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_item_controller.g.dart';

@riverpod
class ListedCoinItemController extends _$ListedCoinItemController {
  late final GetCoinMetadataUseCase _getCoinMetadata;
  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final AddSelectedCoinUseCase _addSelectedCoin;
  late final RemoveSelectedCoinUseCase _removeSelectedCoin;

  @override
  ListedCoinItemState build(ListedCoin listedCoin) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _addSelectedCoin = ref.watch(addSelectedCoinUseCaseProvider);
    _removeSelectedCoin = ref.watch(removeSelectedCoinUseCaseProvider);

    final metadata = _getCoinMetadata(listedCoin.symbol);

    final initialState = ListedCoinItemState.initial(
      listedCoin: listedCoin,
      metadata: metadata,
    );

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
