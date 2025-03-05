import 'package:crpto/shared/domain/model/kline/kline.dart';
import 'package:crpto/shared/domain/model/kline/kline_interval.dart';

abstract interface class IKlineRepository {
  Future<List<Kline>> getAllBySymbol(
    String symbol, {
    required KlineInterval interval,
    DateTime? startTime,
    DateTime? endTime,
    String? timeZone,
  });
}
