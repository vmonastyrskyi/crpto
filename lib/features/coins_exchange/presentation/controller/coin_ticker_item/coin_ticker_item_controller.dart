import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_item/coin_ticker_item_state.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_list/coin_ticker_list_controller.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_ticker_item_controller.g.dart';

@riverpod
class CoinTickerItemController extends _$CoinTickerItemController {
  late final GetCoinMetadataUseCase _getCoinMetadata;

  @override
  CoinTickerItemState build(String symbol) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);

    final metadata = _loadCoinMetadata(symbol);

    ref.listen(coinTickerListControllerProvider, (_, next) {
      next.whenData((data) {
        final coinTicker = data.tickers[symbol];

        if (coinTicker != null) {
          state = CoinTickerItemState.data(
            metadata: metadata,
            ticker: coinTicker,
          );
        }
      });
    });

    return CoinTickerItemState.initial(metadata: metadata);
  }

  CoinMetadata _loadCoinMetadata(String symbol) => _getCoinMetadata(symbol);
}
