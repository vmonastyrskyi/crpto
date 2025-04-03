import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_ticker_dto.freezed.dart';

@freezed
@JsonSerializable(createFactory: false, createToJson: false)
class CoinTickerDTO with _$CoinTickerDTO {
  const CoinTickerDTO({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.lastPrice,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.count,
  });

  @override
  final String symbol;
  @override
  final String priceChange;
  @override
  final String priceChangePercent;
  @override
  final String lastPrice;
  @override
  final String openPrice;
  @override
  final String highPrice;
  @override
  final String lowPrice;
  @override
  final String volume;
  @override
  final String quoteVolume;
  @override
  final int count;

  factory CoinTickerDTO.fromJson(Map<String, dynamic> json) {
    return CoinTickerDTO(
      symbol: (json['symbol'] ??= json['s']) as String,
      priceChange: (json['priceChange'] ??= json['p']) as String,
      priceChangePercent: (json['priceChangePercent'] ??= json['P']) as String,
      lastPrice: (json['lastPrice'] ??= json['c']) as String,
      openPrice: (json['openPrice'] ??= json['o']) as String,
      highPrice: (json['highPrice'] ??= json['h']) as String,
      lowPrice: (json['lowPrice'] ??= json['l']) as String,
      volume: (json['volume'] ??= json['v']) as String,
      quoteVolume: (json['quoteVolume'] ??= json['q']) as String,
      count: (json['count'] ??= json['n']) as int,
    );
  }
}

extension CoinTickerDTOMapper on CoinTickerDTO {
  static CoinTicker toModel(CoinTickerDTO dto) {
    return CoinTicker(
      symbol: dto.symbol,
      priceChange: double.parse(dto.priceChange),
      priceChangePercent: double.parse(dto.priceChangePercent),
      lastPrice: double.parse(dto.lastPrice),
      openPrice: double.parse(dto.openPrice),
      highPrice: double.parse(dto.highPrice),
      lowPrice: double.parse(dto.lowPrice),
      volume: double.parse(dto.volume),
      quoteVolume: double.parse(dto.quoteVolume),
      count: dto.count,
    );
  }
}
