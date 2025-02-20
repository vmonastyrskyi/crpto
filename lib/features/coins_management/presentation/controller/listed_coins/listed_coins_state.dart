import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coins_state.freezed.dart';

enum ListedCoinsStatus { initial, loading, loaded, error }

enum ListedCoinsSearchStatus { initial, loading, searched, error }

@freezed
class ListedCoinsState with _$ListedCoinsState {
  const factory ListedCoinsState({
    required ListedCoinsStatus status,
    required ListedCoinsSearchStatus searchStatus,
    required List<ListedCoin> listedCoins,
  }) = _ListedCoinsState;

  factory ListedCoinsState.initial() => const ListedCoinsState(
    status: ListedCoinsStatus.initial,
    searchStatus: ListedCoinsSearchStatus.initial,
    listedCoins: [],
  );
}
