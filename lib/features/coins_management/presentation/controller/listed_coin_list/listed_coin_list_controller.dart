import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/features/coins_management/application/use_case/get_listed_coins.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coin_item/listed_coin_item_controller.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coin_list/listed_coin_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_list_controller.g.dart';

@Riverpod(keepAlive: true)
class ListedCoinListController extends _$ListedCoinListController {
  final Debounce _searchListedCoinsDebounce = Debounce();

  late final GetListedCoinsUseCase _getListedCoins;

  @override
  ListedCoinListState build() {
    _getListedCoins = ref.watch(getListedCoinsUseCaseProvider);

    ref.onDispose(() => _searchListedCoinsDebounce.cancel());

    return const ListedCoinListState.initial();
  }

  List<ListedCoin> _lastListedCoins = const [];

  String _lastSearchValue = emptyString;

  Future<void> loadListedCoins() async {
    state = state.copyWith(
      status: ListedCoinsStatus.loading,
      searchStatus: ListedCoinsSearchStatus.initial,
    );

    _lastListedCoins = _sortListedCoins(_lastListedCoins);

    state = state.copyWith(listedCoins: _lastListedCoins);

    _lastListedCoins = _sortListedCoins(await _getListedCoins());

    state = state.copyWith(
      status: ListedCoinsStatus.loaded,
      listedCoins: _lastListedCoins,
    );
  }

  void searchListedCoins(String searchValue) {
    _searchListedCoinsDebounce(() {
      final modifiedSearchValue = searchValue.trim();

      if (modifiedSearchValue.isNotEmpty) {
        if (modifiedSearchValue == _lastSearchValue) return;

        state = state.copyWith(searchStatus: ListedCoinsSearchStatus.loading);

        final searchedListedCoins =
            _lastListedCoins.where((listedCoin) {
              final coinBaseAsset = listedCoin.baseAsset.toLowerCase();
              final coinDisplayName = CryptoUtils.getDisplayName(coinBaseAsset);
              final searchRegExp = RegExp(
                caseSensitive: false,
                modifiedSearchValue,
              );

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

      _lastSearchValue = modifiedSearchValue;
    }, const Duration(milliseconds: 250));
  }

  List<ListedCoin> _sortListedCoins(List<ListedCoin> listedCoins) {
    final unselectedListedCoins = <ListedCoin>[];

    final selectedListedCoins =
        listedCoins.where((listedCoin) {
            final isSelected =
                ref.read(listedCoinItemControllerProvider(listedCoin)).selected;

            if (!isSelected) {
              unselectedListedCoins.add(listedCoin);
            }

            return isSelected;
          }).toList()
          ..sort((a, b) => a.symbol.compareTo(b.symbol));

    unselectedListedCoins.sort((a, b) => a.symbol.compareTo(b.symbol));

    return [...selectedListedCoins, ...unselectedListedCoins];
  }
}
