import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_kline_dto.freezed.dart';

@freezed
class CoinKlineDTO with _$CoinKlineDTO {
  const CoinKlineDTO({
    required this.openTime,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.closePrice,
    required this.closeTime,
    required this.volume,
    required this.quoteVolume,
    required this.count,
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
  @override
  final String volume;
  @override
  final String quoteVolume;
  @override
  final int count;

  factory CoinKlineDTO.fromList(List<dynamic> list) {
    if (list.length < 9) {
      throw const FormatException('Coin kline data has insufficient elements');
    }

    return CoinKlineDTO(
      openTime: list[0] as int,
      openPrice: list[1] as String,
      highPrice: list[2] as String,
      lowPrice: list[3] as String,
      closePrice: list[4] as String,
      closeTime: list[6] as int,
      volume: list[5] as String,
      quoteVolume: list[7] as String,
      count: list[8] as int,
    );
  }
}

extension CoinKlineDTOMapper on CoinKlineDTO {
  static CoinKline toModel(CoinKlineDTO dto) {
    return CoinKline(
      openTime: DateTime.fromMillisecondsSinceEpoch(dto.openTime),
      openPrice: double.parse(dto.openPrice),
      highPrice: double.parse(dto.highPrice),
      lowPrice: double.parse(dto.lowPrice),
      closePrice: double.parse(dto.closePrice),
      closeTime: DateTime.fromMillisecondsSinceEpoch(dto.closeTime),
      volume: double.parse(dto.volume),
      quoteVolume: double.parse(dto.quoteVolume),
      count: dto.count,
    );
  }
}
