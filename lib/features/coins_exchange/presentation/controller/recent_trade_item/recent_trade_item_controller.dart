import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_item/recent_trade_item_state.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_list/recent_trade_list_controller.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'generated/recent_trade_item_controller.g.dart';

@riverpod
class RecentTradeItemController extends _$RecentTradeItemController {
  final BehaviorSubject<RecentTrade> _tradeStreamController = BehaviorSubject();

  late final GetCoinMetadataUseCase _getCoinMetadata;

  @override
  RecentTradeItemState build(String symbol) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);

    final metadata = _loadCoinMetadata(symbol);

    ref.listen(recentTradeListControllerProvider, (_, next) {
      next.whenData((data) {
        final recentTrade = data.recentTrades[symbol];

        if (recentTrade != null) {
          _tradeStreamController.add(recentTrade);
        }
      });
    });

    _tradeStreamController
        .throttleTime(
          const Duration(seconds: 1),
          trailing: true,
          leading: false,
        )
        .listen((recentTrade) {
          state = RecentTradeItemState.data(
            recentTrade: recentTrade,
            metadata: metadata,
          );
        });

    return RecentTradeItemState.initial(metadata: metadata);
  }

  CoinMetadata _loadCoinMetadata(String symbol) => _getCoinMetadata(symbol);
}
