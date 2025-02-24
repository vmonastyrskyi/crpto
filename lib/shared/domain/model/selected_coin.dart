import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/selected_coin.freezed.dart';

@freezed
class SelectedCoin with _$SelectedCoin {
  factory SelectedCoin({
    required String symbol,
    required String baseAsset,
    required String quoteAsset,
  }) = _SelectedCoin;
}
