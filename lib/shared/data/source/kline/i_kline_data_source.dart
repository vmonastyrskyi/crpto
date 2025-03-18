import 'package:crpto/shared/data/dto/kline/kline_dto.dart';

abstract interface class IKlineDataSource {
  Future<List<KlineDTO>> getAllBySymbol(
    String symbol, {
    required String interval,
    int? startTime,
    int? endTime,
    String? timeZone,
  });
}
