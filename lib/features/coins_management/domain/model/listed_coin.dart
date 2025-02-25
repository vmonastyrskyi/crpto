import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin.freezed.dart';

@freezed
class ListedCoin with _$ListedCoin {
  factory ListedCoin({
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
    required String status,
  }) = _ListedCoin;
}
