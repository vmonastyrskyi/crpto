import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_interval.dart';

abstract interface class IKlineRepository {
  Future<List<CoinKline>> getAllBySymbol(
    String symbol, {
    required KlineInterval interval,
    DateTime? startTime,
    DateTime? endTime,
    String? timeZone,
  });
}
