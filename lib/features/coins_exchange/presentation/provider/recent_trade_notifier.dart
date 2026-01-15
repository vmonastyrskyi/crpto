import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trades_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'generated/recent_trade_notifier.g.dart';

@riverpod
class RecentTradeNotifier extends _$RecentTradeNotifier {
  final BehaviorSubject<RecentTrade> _recentTradeStreamController =
      BehaviorSubject();

  @override
  RecentTrade? build(String symbol) {
    ref.onDispose(() => _recentTradeStreamController.close());

    ref.listen(recentTradesProvider, (_, newState) {
      newState.whenData((recentTrades) {
        final recentTrade = recentTrades[symbol];

        if (recentTrade != null) {
          _recentTradeStreamController.add(recentTrade);
        }
      });
    });

    _recentTradeStreamController
        .throttleTime(const Duration(seconds: 1))
        .listen((recentTrade) => state = recentTrade);

    return null;
  }
}
