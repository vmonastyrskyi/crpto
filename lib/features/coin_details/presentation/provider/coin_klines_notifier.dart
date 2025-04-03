import 'package:crpto/shared/application/use_case/coin_kline/get_coin_klines.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_interval.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/coin_klines_notifier.g.dart';

@riverpod
class CoinKlinesNotifier extends _$CoinKlinesNotifier {
  late GetCoinKlinesUseCase _getCoinKlines;

  @override
  Future<Map<KlinePeriod, List<CoinKline>>> build(String symbol) async {
    _getCoinKlines = ref.watch(getCoinKlinesUseCaseProvider);

    final coinKlinePeriods = <KlinePeriod, List<CoinKline>>{};

    for (final klinePeriod in KlinePeriod.values) {
      final coinKlines = await _loadCoinKlines(klinePeriod);

      coinKlinePeriods[klinePeriod] = coinKlines;
    }

    return coinKlinePeriods;
  }

  Future<List<CoinKline>> _loadCoinKlines(KlinePeriod klinePeriod) async {
    final nowDate = DateTime.now();

    final klineInterval = switch (klinePeriod) {
      KlinePeriod.oneHour => KlineInterval.oneMinute,
      KlinePeriod.oneDay => KlineInterval.fifteenMinutes,
      KlinePeriod.oneWeek => KlineInterval.twoHours,
      KlinePeriod.oneMonth => KlineInterval.eightHours,
      KlinePeriod.oneYear => KlineInterval.threeDays,
      KlinePeriod.allTime => KlineInterval.oneMonth,
    };
    final startTime = nowDate.subtract(
      klinePeriod.duration + klineInterval.duration,
    );
    final endTime = nowDate;

    return await _getCoinKlines(
      interval: klineInterval,
      startTime: startTime,
      endTime: endTime,
      symbol,
    );
  }
}
