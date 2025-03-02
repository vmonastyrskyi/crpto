import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coins_state.freezed.dart';

enum ListedCoinsStatus { initial, loading, loaded, error }

enum ListedCoinsSearchStatus { initial, loading, searched, error }

@freezed
class ListedCoinsState with _$ListedCoinsState {
  const ListedCoinsState._({
    required this.status,
    required this.searchStatus,
    required this.listedCoins,
  });

  const ListedCoinsState.initial()
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
