// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cmc_coin_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmcCoinIdDTO _$CmcCoinIdDTOFromJson(Map<String, dynamic> json) => CmcCoinIdDTO(
  id: (json['id'] as num).toInt(),
  baseAsset: json['symbol'] as String,
  slug: json['slug'] as String,
  rank: (json['rank'] as num?)?.toInt(),
);
