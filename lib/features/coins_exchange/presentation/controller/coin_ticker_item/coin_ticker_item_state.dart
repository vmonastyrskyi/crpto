import 'package:crpto/shared/domain/model/coin_metadata.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_ticker_item_state.freezed.dart';

@freezed
class CoinTickerItemState with _$CoinTickerItemState {
  const CoinTickerItemState._({required this.metadata, this.ticker});

  const CoinTickerItemState.initial({required CoinMetadata metadata})
    : this._(metadata: metadata);

  const CoinTickerItemState.data({
    required CoinMetadata metadata,
    CoinTicker? ticker,
  }) : this._(metadata: metadata, ticker: ticker);

  @override
  final CoinMetadata metadata;
  @override
  final CoinTicker? ticker;
}
