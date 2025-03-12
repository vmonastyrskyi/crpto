// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recent_trade_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentTradeDTO _$RecentTradeDTOFromJson(Map<String, dynamic> json) =>
    RecentTradeDTO(
      id: (json['t'] as num).toInt(),
      symbol: json['s'] as String,
      price: json['p'] as String,
      quantity: json['q'] as String,
      isBuyerMaker: json['m'] as bool,
    );
