import 'package:cron/cron.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_kline_list/coin_kline_list_state.dart';
import 'package:crpto/shared/application/use_case/kline/get_klines_by_symbol.dart';
import 'package:crpto/shared/domain/model/kline/kline_interval.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_kline_list_controller.g.dart';

final Schedule _everyHourSchedule = Schedule.parse('0 * * * *');

@riverpod
class CoinKlineListController extends _$CoinKlineListController {
  late final GetKlinesBySymbolUseCase _getKlinesBySymbol;

  @override
  Future<CoinKlineListState> build(String symbol) {
    _getKlinesBySymbol = ref.watch(getKlinesBySymbolUseCaseProvider);

    final loadKlinesScheduledTask = Cron().schedule(
      _everyHourSchedule,
      _loadKlines,
    );

    ref.onDispose(() => loadKlinesScheduledTask.cancel());

    return _loadKlines();
  }

  Future<CoinKlineListState> _loadKlines() async {
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

    state = AsyncData(CoinKlineListState.data(klines: klines));

    return await future;
  }
}
