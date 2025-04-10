// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../cmc_coin_metadata_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CmcCoinMetadataDTO _$CmcCoinMetadataDTOFromJson(Map<String, dynamic> json) =>
    CmcCoinMetadataDTO(
      id: (json['id'] as num).toInt(),
      baseAsset: json['symbol'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$CoinCategoryEnumMap, json['category']),
      logo: json['logo'] as String,
      dateAdded: DateTime.parse(json['date_added'] as String),
    );

const _$CoinCategoryEnumMap = {
  CoinCategory.coin: 'coin',
  CoinCategory.token: 'token',
  CoinCategory.nft: 'nft',
};
