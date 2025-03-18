import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_ticker_list_state.freezed.dart';

@freezed
class CoinTickerListState with _$CoinTickerListState {
  const CoinTickerListState._({required this.tickers});

  const CoinTickerListState.initial() : this._(tickers: const {});

  const CoinTickerListState.data({required Map<String, CoinTicker> tickers})
    : this._(tickers: tickers);

  const CoinTickerListState.empty() : this._(tickers: const {});

  @override
  final Map<String, CoinTicker> tickers;
}
