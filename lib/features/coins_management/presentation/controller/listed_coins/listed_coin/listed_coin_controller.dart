import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coins/listed_coin/listed_coin_state.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/application/use_case/selected_coin/add_selected_coin.dart';
import 'package:crpto/shared/application/use_case/selected_coin/get_selected_coins.dart';
import 'package:crpto/shared/application/use_case/selected_coin/remove_selected_coin.dart';
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
  late final GetCoinMetadataUseCase _getCoinMetadata;
  late final GetSelectedCoinsUseCase _getSelectedCoins;
  late final AddSelectedCoinUseCase _addSelectedCoin;
  late final RemoveSelectedCoinUseCase _removeSelectedCoin;

  @override
  ListedCoinState build(ListedCoin listedCoin) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);
    _getSelectedCoins = ref.watch(getSelectedCoinsUseCaseProvider);
    _addSelectedCoin = ref.watch(addSelectedCoinUseCaseProvider);
    _removeSelectedCoin = ref.watch(removeSelectedCoinUseCaseProvider);

    final metadata = _getCoinMetadata.call(listedCoin.symbol);

    final initialState = ListedCoinState.initial(
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

  Future<void> select(bool selected) async {
    final selectedCoin = SelectedCoin(symbol: listedCoin.symbol);

    !selected
        ? await _removeSelectedCoin(selectedCoin)
        : await _addSelectedCoin(selectedCoin);

    state = state.copyWith(selected: selected);
  }
}
