import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_list_state.freezed.dart';

enum ListedCoinsStatus { initial, loading, loaded, error }

enum ListedCoinsSearchStatus { initial, loading, searched, error }

@freezed
class ListedCoinListState with _$ListedCoinListState {
  const ListedCoinListState._({
    required this.status,
    required this.searchStatus,
    required this.listedCoins,
  });

  const ListedCoinListState.initial()
    : this._(
        status: ListedCoinsStatus.initial,
        searchStatus: ListedCoinsSearchStatus.initial,
        listedCoins: const [],
      );

  @override
  final ListedCoinsStatus status;
  @override
  final ListedCoinsSearchStatus searchStatus;
  @override
  final List<ListedCoin> listedCoins;
}
