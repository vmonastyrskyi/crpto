import 'package:crpto/shared/data/repository/kline_repository.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_interval.dart';
import 'package:crpto/shared/domain/repository/i_kline_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_coin_klines.g.dart';

@riverpod
class GetCoinKlinesUseCase extends _$GetCoinKlinesUseCase {
  late IKlineRepository _klineRepository;

  @override
  GetCoinKlinesUseCase build() {
    _klineRepository = ref.watch(klineRepositoryProvider);

    return this;
  }

  Future<List<CoinKline>> call(
    String symbol, {
    required KlineInterval interval,
    DateTime? startTime,
    DateTime? endTime,
    String? timeZone,
  }) => _klineRepository.getAllBySymbol(
    symbol,
    interval: interval,
    startTime: startTime,
    endTime: endTime,
    timeZone: timeZone,
  );
}
