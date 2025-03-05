// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinExchangeStatsDTO _$CoinExchangeStatsDTOFromJson(
  Map<String, dynamic> json,
) => CoinExchangeStatsDTO(
  symbol: json['symbol'] as String,
  priceChange: json['priceChange'] as String,
  priceChangePercent: json['priceChangePercent'] as String,
  lastPrice: json['lastPrice'] as String,
  openPrice: json['openPrice'] as String,
  highPrice: json['highPrice'] as String,
  lowPrice: json['lowPrice'] as String,
  volume: json['volume'] as String,
  quoteVolume: json['quoteVolume'] as String,
);
