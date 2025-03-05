import 'package:crpto/shared/data/repository/kline_repository.dart';
import 'package:crpto/shared/domain/model/kline/kline.dart';
import 'package:crpto/shared/domain/model/kline/kline_interval.dart';
import 'package:crpto/shared/domain/repository/i_kline_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/get_klines_by_symbol.g.dart';

@riverpod
class GetKlinesBySymbolUseCase extends _$GetKlinesBySymbolUseCase {
  late final IKlineRepository _klineRepository;

  @override
  GetKlinesBySymbolUseCase build() {
    _klineRepository = ref.watch(klineRepositoryProvider);

    return this;
  }

  Future<List<Kline>> call(
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
