import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_metadata.freezed.dart';

@freezed
class CoinMetadata with _$CoinMetadata {
  const CoinMetadata({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.displayName,
    required this.status,
    required this.hasIcon,
  });

  @override
  final String symbol;
  @override
  final String baseAsset;
  @override
  final String quoteAsset;
  @override
  final String displayName;
  @override
  final String status;
  @override
  final bool hasIcon;
}
