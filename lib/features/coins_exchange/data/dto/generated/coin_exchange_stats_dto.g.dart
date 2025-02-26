// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../coin_exchange_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinExchangeStatsDTOImpl _$$CoinExchangeStatsDTOImplFromJson(
  Map<String, dynamic> json,
) => _$CoinExchangeStatsDTOImpl(
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

Map<String, dynamic> _$$CoinExchangeStatsDTOImplToJson(
  _$CoinExchangeStatsDTOImpl instance,
) => <String, dynamic>{
  'symbol': instance.symbol,
  'priceChange': instance.priceChange,
  'priceChangePercent': instance.priceChangePercent,
  'lastPrice': instance.lastPrice,
  'openPrice': instance.openPrice,
  'highPrice': instance.highPrice,
  'lowPrice': instance.lowPrice,
  'volume': instance.volume,
  'quoteVolume': instance.quoteVolume,
};
