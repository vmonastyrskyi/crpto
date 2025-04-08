import 'package:crpto/shared/data/dto/coin_kline_dto.dart';
import 'package:crpto/shared/data/source/binance_kline_data_source.dart';
import 'package:crpto/shared/data/source/i_kline_data_source.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_interval.dart';
import 'package:crpto/shared/domain/repository/i_kline_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/kline_repository.g.dart';

@riverpod
class KlineRepository extends _$KlineRepository implements IKlineRepository {
  late IKlineDataSource _klineDataSource;

  @override
  IKlineRepository build() {
    _klineDataSource = ref.watch(binanceKlineDataSourceProvider);

    return this;
  }

  @override
  Future<List<CoinKline>> getAllBySymbol(
    String symbol, {
    required KlineInterval interval,
    DateTime? startTime,
    DateTime? endTime,
    String? timeZone,
  }) async {
    final klineDTOs = await _klineDataSource.getAllBySymbol(
      symbol,
      interval: interval.value,
      startTime: startTime?.millisecondsSinceEpoch,
      endTime: endTime?.millisecondsSinceEpoch,
      timeZone: timeZone,
    );

    final klines = klineDTOs.map(CoinKlineDTOMapper.toModel).toList();

    return klines;
  }
}
