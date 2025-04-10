import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_state.freezed.dart';

@freezed
class ListedCoinState with _$ListedCoinState {
  const ListedCoinState._({required this.listedCoin, required this.selected});

  const ListedCoinState.initial({required ListedCoin listedCoin})
    : this._(listedCoin: listedCoin, selected: false);

  @override
  final ListedCoin listedCoin;
  @override
  final bool selected;
}
