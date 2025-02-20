import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/features/coins_management/application/use_case/get_listed_coins_use_case.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coins/listed_coins_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coins_controller.g.dart';

extension ListedCoinsControllerExtension on WidgetRef {
  ListedCoinsController listedCoinsController() =>
      read(listedCoinsControllerProvider.notifier);
}

@Riverpod(keepAlive: true)
class ListedCoinsController extends _$ListedCoinsController {
  late final GetListedCoinsUseCase _getListedCoinsUseCase;

  @override
  ListedCoinsState build() {
    _getListedCoinsUseCase = ref.watch(getListedCoinsUseCaseProvider);

    return ListedCoinsState.initial();
  }

  List<ListedCoin> _lastListedCoins = const [];

  String _lastSearchValue = emptyString;

  Future<void> loadListedCoins() async {
    state = state.copyWith(
      status: ListedCoinsStatus.loading,
      searchStatus: ListedCoinsSearchStatus.initial,
    );

    final listedCoins = _lastListedCoins = await _getListedCoinsUseCase();

    state = state.copyWith(
      status: ListedCoinsStatus.loaded,
      listedCoins: listedCoins,
    );
  }

  void searchListedCoins(String searchValue) {
    if (searchValue.isNotEmpty) {
      if (searchValue == _lastSearchValue) return;

      state = state.copyWith(searchStatus: ListedCoinsSearchStatus.loading);

      final searchedListedCoins =
          _lastListedCoins.where((listedCoin) {
            final coinBaseAsset = listedCoin.baseAsset.toLowerCase();
            final coinDisplayName = CryptoUtils.getDisplayName(coinBaseAsset);
            final searchRegExp = RegExp(searchValue, caseSensitive: false);

            return searchRegExp.hasMatch(coinBaseAsset) ||
                searchRegExp.hasMatch(coinDisplayName);
          }).toList();

      state = state.copyWith(
        searchStatus: ListedCoinsSearchStatus.searched,
        listedCoins: searchedListedCoins,
      );
    } else {
      state = state.copyWith(
        status: ListedCoinsStatus.loaded,
        listedCoins: _lastListedCoins,
      );
    }

    _lastSearchValue = searchValue;
  }
}
