import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin.freezed.dart';

@freezed
class ListedCoin with _$ListedCoin {
  factory ListedCoin({
    required String symbol,
    required String status,
    required String baseAsset,
    required String quoteAsset,
    @Default(false) bool hasIcon,
  }) = _ListedCoin;
}
