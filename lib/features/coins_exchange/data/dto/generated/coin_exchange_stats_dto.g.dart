// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinExchangeStatsDTO _$CoinExchangeStatsDTOFromJson(
  Map<String, dynamic> json,
) => CoinExchangeStatsDTO(
  symbol: json['symbol'] as String,
  priceChange: json['price_change'] as String,
  priceChangePercent: json['price_change_percent'] as String,
  lastPrice: json['last_price'] as String,
  openPrice: json['open_price'] as String,
  highPrice: json['high_price'] as String,
  lowPrice: json['low_price'] as String,
  volume: json['volume'] as String,
  quoteVolume: json['quote_volume'] as String,
);
