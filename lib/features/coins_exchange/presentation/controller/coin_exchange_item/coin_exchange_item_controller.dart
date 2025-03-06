import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange_item/coin_exchange_item_state.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_exchange_item_controller.g.dart';

@riverpod
class CoinExchangeItemController extends _$CoinExchangeItemController {
  late final GetCoinMetadataUseCase _getCoinMetadata;

  @override
  CoinExchangeItemState build(CoinExchangeStats coinExchangeStats) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);

    final symbol = coinExchangeStats.symbol;

    final metadata = _loadCoinMetadata(symbol);

    final initialState = CoinExchangeItemState.initial(
      coinExchangeStats: coinExchangeStats,
      metadata: metadata,
    );

    return initialState;
  }

  CoinMetadata _loadCoinMetadata(String symbol) => _getCoinMetadata(symbol);
}
