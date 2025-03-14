import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade_item_state.freezed.dart';

@freezed
class RecentTradeItemState with _$RecentTradeItemState {
  const RecentTradeItemState._({required this.metadata, this.trade});

  const RecentTradeItemState.initial({required CoinMetadata metadata})
    : this._(metadata: metadata);

  const RecentTradeItemState.data({
    required CoinMetadata metadata,
    RecentTrade? trade,
  }) : this._(metadata: metadata, trade: trade);

  @override
  final CoinMetadata metadata;
  @override
  final RecentTrade? trade;
}
