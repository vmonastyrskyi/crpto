import 'package:crpto/shared/domain/model/enum/coin_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_metadata.freezed.dart';

@freezed
class CoinMetadata with _$CoinMetadata {
  const CoinMetadata({
    required this.id,
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.tickSize,
    required this.stepSize,
    required this.slug,
    required this.name,
    required this.description,
    required this.category,
    required this.logo,
    required this.dateAdded,
    required this.rank,
  });

  @override
  final int id;
  @override
  final String symbol;
  @override
  final String baseAsset;
  @override
  final String quoteAsset;
  @override
  final String tickSize;
  @override
  final String stepSize;
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
  @override
  final int rank;
}
