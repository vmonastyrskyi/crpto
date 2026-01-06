import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_ticker_notifier.g.dart';

@riverpod
class CoinTickerNotifier extends _$CoinTickerNotifier {
  @override
  CoinTicker? build(String symbol) {
    ref.listen(coinTickersProvider, (_, newState) {
      final coinTicker = newState.value?[symbol];

      if (coinTicker != null) {
        state = coinTicker;
      }
    });

    return null;
  }
}
