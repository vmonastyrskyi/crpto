import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/recent_trade_list_state.freezed.dart';

@freezed
class RecentTradeListState with _$RecentTradeListState {
  const RecentTradeListState._({required this.recentTrades});

  const RecentTradeListState.initial() : this._(recentTrades: const {});

  const RecentTradeListState.data({
    required Map<String, RecentTrade> recentTrades,
  }) : this._(recentTrades: recentTrades);

  @override
  final Map<String, RecentTrade> recentTrades;
}
