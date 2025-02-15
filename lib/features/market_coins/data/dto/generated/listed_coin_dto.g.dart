// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../listed_coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListedCoinDTOImpl _$$ListedCoinDTOImplFromJson(Map<String, dynamic> json) =>
    _$ListedCoinDTOImpl(
      id: json['symbol'] as String,
      status: json['status'] as String,
      baseAsset: json['baseAsset'] as String,
      quoteAsset: json['quoteAsset'] as String,
    );

Map<String, dynamic> _$$ListedCoinDTOImplToJson(_$ListedCoinDTOImpl instance) =>
    <String, dynamic>{
      'symbol': instance.id,
      'status': instance.status,
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
    };
