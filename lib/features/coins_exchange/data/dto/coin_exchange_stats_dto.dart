import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_stats_dto.freezed.dart';
part 'generated/coin_exchange_stats_dto.g.dart';

@freezed
class CoinExchangeStatsDTO with _$CoinExchangeStatsDTO {
  factory CoinExchangeStatsDTO({
    @JsonKey(name: 'symbol') required String symbol,
    @JsonKey(name: 'priceChange') required String priceChange,
    @JsonKey(name: 'priceChangePercent') required String priceChangePercent,
    @JsonKey(name: 'lastPrice') required String lastPrice,
    @JsonKey(name: 'openPrice') required String openPrice,
    @JsonKey(name: 'highPrice') required String highPrice,
    @JsonKey(name: 'lowPrice') required String lowPrice,
    @JsonKey(name: 'volume') required String volume,
    @JsonKey(name: 'quoteVolume') required String quoteVolume,
  }) = _CoinExchangeStatsDTO;

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
