import 'package:cron/cron.dart';
import 'package:crpto/shared/application/use_case/coin_kline/get_coin_klines.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_interval.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_klines_notifier.g.dart';

final Schedule _everyHourSchedule = Schedule.parse('0 * * * *');

@riverpod
class CoinKlinesNotifier extends _$CoinKlinesNotifier {
  late GetCoinKlinesUseCase _getCoinKlines;

  @override
  Future<List<CoinKline>> build(String symbol) {
    _getCoinKlines = ref.watch(getCoinKlinesUseCaseProvider);

    final loadKlinesScheduledTask = Cron().schedule(
      _everyHourSchedule,
      _loadKlines,
    );

    ref.onDispose(() => loadKlinesScheduledTask.cancel());

    return _loadKlines();
  }

  Future<List<CoinKline>> _loadKlines() async {
    final nowDate = DateTime.now();

    final interval = KlineInterval.oneHour;
    final startTime = nowDate.subtract(KlinePeriod.oneDay.duration);
    final endTime = nowDate;

    final klines = await _getCoinKlines(
      symbol,
      interval: interval,
      startTime: startTime,
      endTime: endTime,
    );

    state = AsyncData(klines);

    return await future;
  }
}
