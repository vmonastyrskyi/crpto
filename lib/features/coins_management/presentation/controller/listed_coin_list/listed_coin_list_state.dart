import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_list_state.freezed.dart';

enum ListedCoinsSearchStatus { initial, loading, searched, error }

@freezed
class ListedCoinListState with _$ListedCoinListState {
  const ListedCoinListState._({
    required this.searchStatus,
    required this.listedCoins,
  });

  const ListedCoinListState.initial()
    : this._(
        searchStatus: ListedCoinsSearchStatus.initial,
        listedCoins: const [],
      );

  const ListedCoinListState.data({required List<ListedCoin> listedCoins})
    : this._(
        searchStatus: ListedCoinsSearchStatus.initial,
        listedCoins: listedCoins,
      );

  const ListedCoinListState.searching()
    : this._(
        searchStatus: ListedCoinsSearchStatus.loading,
        listedCoins: const [],
      );

  const ListedCoinListState.searchedData({required List<ListedCoin> listedCoins})
    : this._(
        searchStatus: ListedCoinsSearchStatus.searched,
        listedCoins: listedCoins,
      );

  @override
  final ListedCoinsSearchStatus searchStatus;
  @override
  final List<ListedCoin> listedCoins;
}
