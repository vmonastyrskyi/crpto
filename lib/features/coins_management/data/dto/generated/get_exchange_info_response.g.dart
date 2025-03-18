// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_exchange_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExchangeInfoResponse _$GetExchangeInfoResponseFromJson(
  Map<String, dynamic> json,
) => GetExchangeInfoResponse(
  listedCoins:
      (json['symbols'] as List<dynamic>)
          .map((e) => ListedCoinDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);
