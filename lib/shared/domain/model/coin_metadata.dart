import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_metadata.freezed.dart';

@freezed
class CoinMetadata with _$CoinMetadata {
  factory CoinMetadata({
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
    required String displayName,
    required String status,
    required bool hasIcon,
  }) = _CoinMetadata;
}
