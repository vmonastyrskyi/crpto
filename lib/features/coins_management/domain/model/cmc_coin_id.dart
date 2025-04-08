import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/cmc_coin_id.freezed.dart';

@freezed
class CmcCoinId with _$CmcCoinId {
  const CmcCoinId({
    required this.id,
    required this.baseAsset,
    required this.slug,
    this.rank,
  });

  @override
  final int id;
  @override
  final String baseAsset;
  @override
  final String slug;
  @override
  final int? rank;
}
