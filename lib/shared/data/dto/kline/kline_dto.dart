import 'package:crpto/shared/domain/model/kline/kline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/kline_dto.freezed.dart';

@freezed
class KlineDTO with _$KlineDTO {
  const KlineDTO({
    required this.openTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.closeTime,
  });

  @override
  final int openTime;
  @override
  final String openPrice;
  @override
  final String highPrice;
  @override
  final String lowPrice;
  @override
  final String closePrice;
  @override
  final int closeTime;

  factory KlineDTO.fromList(List<dynamic> list) {
    if (list.length < 6) {
      throw const FormatException('Kline data has insufficient elements');
    }

    return KlineDTO(
      openTime: list[0] as int,
      openPrice: list[1] as String,
      highPrice: list[2] as String,
      lowPrice: list[3] as String,
      closePrice: list[4] as String,
      closeTime: list[6] as int,
    );
  }
}

extension KlineDTOMapper on KlineDTO {
  static Kline toModel(KlineDTO klineDTO) {
    return Kline(
      openTime: DateTime.fromMillisecondsSinceEpoch(klineDTO.openTime),
      openPrice: double.parse(klineDTO.openPrice),
      highPrice: double.parse(klineDTO.highPrice),
      lowPrice: double.parse(klineDTO.lowPrice),
      closePrice: double.parse(klineDTO.closePrice),
      closeTime: DateTime.fromMillisecondsSinceEpoch(klineDTO.closeTime),
    );
  }
}
