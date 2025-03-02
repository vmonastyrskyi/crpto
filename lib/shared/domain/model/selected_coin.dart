import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/selected_coin.freezed.dart';

@freezed
class SelectedCoin with _$SelectedCoin {
  const SelectedCoin({required this.symbol});

  @override
  final String symbol;
}
