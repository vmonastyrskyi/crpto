import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/features/coins_management/application/use_case/get_listed_coins.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coin_list/listed_coin_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coin_list_controller.g.dart';

@Riverpod(keepAlive: true)
class ListedCoinListController extends _$ListedCoinListController {
  final Debounce _searchListedCoinsDebounce = Debounce();

  late GetListedCoinsUseCase _getListedCoins;

  List<ListedCoin> _lastListedCoins = const [];
  String _lastSearchValue = emptyString;

  @override
  Future<ListedCoinListState> build() {
    _getListedCoins = ref.watch(getListedCoinsUseCaseProvider);

    ref.onDispose(() => _searchListedCoinsDebounce.cancel());

    return _loadListedCoins();
  }

  void searchListedCoins(String searchValue) {
    _searchListedCoinsDebounce(() {
      final modifiedSearchValue = searchValue.trim();

      if (modifiedSearchValue.isNotEmpty) {
        if (modifiedSearchValue == _lastSearchValue) return;

        state = const AsyncData(ListedCoinListState.searching());

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

        state = AsyncData(
          ListedCoinListState.searchedData(listedCoins: searchedListedCoins),
        );
      } else {
        state = AsyncData(
          ListedCoinListState.data(listedCoins: _lastListedCoins),
        );
      }

      _lastSearchValue = modifiedSearchValue;
    }, const Duration(milliseconds: 250));
  }

  Future<ListedCoinListState> _loadListedCoins() async {
    state = const AsyncLoading();

    final listedCoins = _lastListedCoins = await _getListedCoins();

    state = AsyncData(ListedCoinListState.data(listedCoins: listedCoins));

    return await future;
  }
}
