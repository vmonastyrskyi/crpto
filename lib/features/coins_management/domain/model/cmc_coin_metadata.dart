import 'package:crpto/shared/domain/model/enum/coin_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/cmc_coin_metadata.freezed.dart';

@freezed
class CmcCoinMetadata with _$CmcCoinMetadata {
  const CmcCoinMetadata({
    required this.id,
    required this.baseAsset,
    required this.slug,
    required this.name,
    required this.description,
    required this.category,
    required this.logo,
    required this.dateAdded,
  });

  @override
  final int id;
  @override
  final String baseAsset;
  @override
  final String slug;
  @override
  final String name;
  @override
  final String description;
  @override
  final CoinCategory category;
  @override
  final String logo;
  @override
  final DateTime dateAdded;
}
