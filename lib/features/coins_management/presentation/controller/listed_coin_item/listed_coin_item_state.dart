import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin_item_state.freezed.dart';

@freezed
class ListedCoinItemState with _$ListedCoinItemState {
  const ListedCoinItemState._({
    required this.listedCoin,
    required this.metadata,
    required this.selected,
  });

  const ListedCoinItemState.initial({
    required ListedCoin listedCoin,
    required CoinMetadata metadata,
  }) : this._(listedCoin: listedCoin, metadata: metadata, selected: false);

  @override
  final ListedCoin listedCoin;
  @override
  final CoinMetadata metadata;
  @override
  final bool selected;
}
