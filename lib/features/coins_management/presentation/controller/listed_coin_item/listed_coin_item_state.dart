import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_item_state.freezed.dart';

@freezed
class ListedCoinItemState with _$ListedCoinItemState {
  const ListedCoinItemState._({
    required this.listedCoin,
    required this.selected,
  });

  const ListedCoinItemState.initial({required ListedCoin listedCoin})
    : this._(listedCoin: listedCoin, selected: false);

  @override
  final ListedCoin listedCoin;
  @override
  final bool selected;
}
