import 'package:cron/cron.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/item/klines/coin_exchange_item_klines_state.dart';
import 'package:crpto/shared/application/use_case/kline/get_klines_by_symbol.dart';
import 'package:crpto/shared/domain/model/kline/kline_interval.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_exchange_item_klines_controller.g.dart';

final Schedule _everyHourSchedule = Schedule.parse('0 * * * *');

@riverpod
class CoinExchangeItemKlinesController
    extends _$CoinExchangeItemKlinesController {
  late final GetKlinesBySymbolUseCase _getKlinesBySymbol;

  @override
  FutureOr<CoinExchangeItemKlinesState> build(String symbol) async {
    _getKlinesBySymbol = ref.watch(getKlinesBySymbolUseCaseProvider);

    final loadKlinesScheduledTask = Cron().schedule(
      _everyHourSchedule,
      _loadKlines,
    );

    ref.onDispose(() => loadKlinesScheduledTask.cancel());

    return _loadKlines();
  }

  Future<CoinExchangeItemKlinesState> _loadKlines() async {
    final nowDate = DateTime.now();
    final startTime = nowDate.subtract(const Duration(days: 1, hours: 1));
    final interval = KlineInterval.oneHour;

    state = const AsyncLoading();

    final klines = await _getKlinesBySymbol(
      symbol,
      interval: interval,
      startTime: startTime,
      endTime: nowDate,
    );

    state = AsyncData(CoinExchangeItemKlinesState.data(klines));

    return await future;
  }
}
