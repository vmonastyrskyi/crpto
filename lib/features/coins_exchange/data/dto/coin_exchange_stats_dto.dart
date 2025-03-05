import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_stats_dto.freezed.dart';
part 'generated/coin_exchange_stats_dto.g.dart';

@freezed
@JsonSerializable(createToJson: false)
class CoinExchangeStatsDTO with _$CoinExchangeStatsDTO {
  const CoinExchangeStatsDTO({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.lastPrice,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
  });

  @override
  @JsonKey(name: 'symbol')
  final String symbol;
  @override
  @JsonKey(name: 'priceChange')
  final String priceChange;
  @override
  @JsonKey(name: 'priceChangePercent')
  final String priceChangePercent;
  @override
  @JsonKey(name: 'lastPrice')
  final String lastPrice;
  @override
  @JsonKey(name: 'openPrice')
  final String openPrice;
  @override
  @JsonKey(name: 'highPrice')
  final String highPrice;
  @override
  @JsonKey(name: 'lowPrice')
  final String lowPrice;
  @override
  @JsonKey(name: 'volume')
  final String volume;
  @override
  @JsonKey(name: 'quoteVolume')
  final String quoteVolume;

  factory CoinExchangeStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$CoinExchangeStatsDTOFromJson(json);
}

extension CoinExchangeStatsDTOMapper on CoinExchangeStatsDTO {
  CoinExchangeStats toModel() {
    return CoinExchangeStats(
      symbol: symbol,
      priceChange: double.parse(priceChange),
      priceChangePercent: double.parse(priceChangePercent),
      lastPrice: double.parse(lastPrice),
      openPrice: double.parse(openPrice),
      highPrice: double.parse(highPrice),
      lowPrice: double.parse(lowPrice),
      volume: double.parse(volume),
      quoteVolume: double.parse(quoteVolume),
    );
  }
}
