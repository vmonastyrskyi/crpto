import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/features/coins_management/application/use_case/get_listed_coins.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_state.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/listed_coins_view_model.g.dart';

@Riverpod(keepAlive: true)
class ListedCoinsViewModel extends _$ListedCoinsViewModel {
  final Debounce _searchListedCoinsDebounce = Debounce();

  late GetListedCoinsUseCase _getListedCoinsUseCase;

  List<ListedCoin> _lastListedCoins = const [];
  String _lastSearchValue = emptyString;

  @override
  Future<ListedCoinsState> build() {
    _getListedCoinsUseCase = ref.watch(getListedCoinsUseCaseProvider);

    ref.onDispose(() => _searchListedCoinsDebounce.cancel());

    return _loadListedCoins();
  }

  void searchListedCoins(String searchValue) {
    _searchListedCoinsDebounce(() {
      final modifiedSearchValue = searchValue.trim();

      if (modifiedSearchValue.isNotEmpty) {
        if (modifiedSearchValue == _lastSearchValue) return;

        state = const AsyncData(ListedCoinsState.searching());

        final searchedListedCoins =
            _lastListedCoins.where((listedCoin) {
              final coinMetadata = ref.read(
                coinMetadataProvider(listedCoin.symbol),
              );

              final coinBaseAsset = coinMetadata.baseAsset;
              final coinDisplayName = coinMetadata.name;
              final searchRegExp = RegExp(
                caseSensitive: false,
                modifiedSearchValue,
              );

              return searchRegExp.hasMatch(coinBaseAsset) ||
                  searchRegExp.hasMatch(coinDisplayName);
            }).toList();

        state = AsyncData(
          ListedCoinsState.searchedData(listedCoins: searchedListedCoins),
        );
      } else {
        state = AsyncData(ListedCoinsState.data(listedCoins: _lastListedCoins));
      }

      _lastSearchValue = modifiedSearchValue;
    }, const Duration(milliseconds: 250));
  }

  Future<ListedCoinsState> _loadListedCoins() async {
    state = const AsyncLoading();

    final listedCoins = _lastListedCoins = await _getListedCoinsUseCase();

    state = AsyncData(ListedCoinsState.data(listedCoins: listedCoins));

    return await future;
  }
}
