import 'package:crpto/shared/domain/model/enum/coin_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/listed_coin.freezed.dart';

@freezed
class ListedCoin with _$ListedCoin {
  const ListedCoin({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
    required this.status,
    required this.tickSize,
    required this.stepSize,
  });

  @override
  final String symbol;
  @override
  final String baseAsset;
  @override
  final String quoteAsset;
  @override
  final CoinStatus status;
  @override
  final String tickSize;
  @override
  final String stepSize;
}
