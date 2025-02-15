// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_exchange_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetExchangeInfoResponseImpl _$$GetExchangeInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetExchangeInfoResponseImpl(
      listedCoins: (json['symbols'] as List<dynamic>)
          .map((e) => ListedCoinDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetExchangeInfoResponseImplToJson(
        _$GetExchangeInfoResponseImpl instance) =>
    <String, dynamic>{
      'symbols': instance.listedCoins.map((e) => e.toJson()).toList(),
    };
