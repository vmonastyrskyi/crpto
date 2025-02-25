import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_state.freezed.dart';

@freezed
class ListedCoinState with _$ListedCoinState {
  const factory ListedCoinState({
    required ListedCoin listedCoin,
    required CoinMetadata metadata,
    required bool selected,
  }) = _ListedCoinState;

  factory ListedCoinState.initial({
    required ListedCoin listedCoin,
    required CoinMetadata metadata,
    bool selected = false,
  }) => ListedCoinState(
    listedCoin: listedCoin,
    metadata: metadata,
    selected: selected,
  );
}
