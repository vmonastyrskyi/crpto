import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coins_state.freezed.dart';

enum ListedCoinsSearchStatus { initial, loading, searched, error }

@freezed
class ListedCoinsState with _$ListedCoinsState {
  const ListedCoinsState._({
    required this.searchStatus,
    required this.listedCoins,
  });

  const ListedCoinsState.initial()
    : this._(
        searchStatus: ListedCoinsSearchStatus.initial,
        listedCoins: const [],
      );

  const ListedCoinsState.data({required List<ListedCoin> listedCoins})
    : this._(
        searchStatus: ListedCoinsSearchStatus.initial,
        listedCoins: listedCoins,
      );

  const ListedCoinsState.searching()
    : this._(
        searchStatus: ListedCoinsSearchStatus.loading,
        listedCoins: const [],
      );

  const ListedCoinsState.searchedData({required List<ListedCoin> listedCoins})
    : this._(
        searchStatus: ListedCoinsSearchStatus.searched,
        listedCoins: listedCoins,
      );

  @override
  final ListedCoinsSearchStatus searchStatus;
  @override
  final List<ListedCoin> listedCoins;
}
