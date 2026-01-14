// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListedCoinDTO _$ListedCoinDTOFromJson(Map<String, dynamic> json) =>
    ListedCoinDTO(
      symbol: json['symbol'] as String,
      baseAsset: json['baseAsset'] as String,
      quoteAsset: json['quoteAsset'] as String,
      status: $enumDecode(_$CoinStatusEnumMap, json['status']),
      tickSize: json['tickSize'] as String,
      stepSize: json['stepSize'] as String,
    );

const _$CoinStatusEnumMap = {
  CoinStatus.breaking: 'BREAK',
  CoinStatus.halt: 'HALT',
  CoinStatus.trading: 'TRADING',
};
