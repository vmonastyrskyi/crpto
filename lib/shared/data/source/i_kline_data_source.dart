import 'package:crpto/shared/data/dto/coin_kline_dto.dart';

abstract interface class IKlineDataSource {
  Future<List<CoinKlineDTO>> getAllBySymbol(
    String symbol, {
    required String interval,
    int? startTime,
    int? endTime,
    String? timeZone,
  });
}
