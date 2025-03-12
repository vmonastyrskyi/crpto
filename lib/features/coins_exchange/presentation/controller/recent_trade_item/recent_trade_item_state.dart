import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade_item_state.freezed.dart';

@freezed
class RecentTradeItemState with _$RecentTradeItemState {
  const RecentTradeItemState._({this.recentTrade, required this.metadata});

  const RecentTradeItemState.initial({required CoinMetadata metadata})
    : this._(metadata: metadata);

  const RecentTradeItemState.data({
    RecentTrade? recentTrade,
    required CoinMetadata metadata,
  }) : this._(recentTrade: recentTrade, metadata: metadata);

  @override
  final RecentTrade? recentTrade;
  @override
  final CoinMetadata metadata;
}
