import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange/coin_exchange_state.dart';
import 'package:crpto/shared/application/use_case/coin_metadata/get_coin_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_exchange_controller.g.dart';

@riverpod
class CoinExchangeController extends _$CoinExchangeController {
  late final GetCoinMetadataUseCase _getCoinMetadata;

  @override
  CoinExchangeState build(CoinExchangeStats exchangeStats) {
    _getCoinMetadata = ref.watch(getCoinMetadataUseCaseProvider);

    final metadata = _getCoinMetadata.call(exchangeStats.symbol);

    final initialState = CoinExchangeState.initial(
      exchangeStats: exchangeStats,
      metadata: metadata,
    );

    return initialState;
  }
}
