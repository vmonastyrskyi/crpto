import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_state.freezed.dart';

@freezed
class ListedCoinState with _$ListedCoinState {
  const factory ListedCoinState({
    required ListedCoin listedCoin,
    required bool selected,
  }) = _ListedCoinState;

  factory ListedCoinState.initial({
    required ListedCoin listedCoin,
    bool selected = false,
  }) => ListedCoinState(
    listedCoin: listedCoin,
    selected: selected,
  );
}
