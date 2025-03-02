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
