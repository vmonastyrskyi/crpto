import 'package:crpto/shared/domain/model/kline/kline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_exchange_item_klines_state.freezed.dart';

@freezed
class CoinExchangeItemKlinesState with _$CoinExchangeItemKlinesState {
  const CoinExchangeItemKlinesState._({required this.klines});

  const CoinExchangeItemKlinesState.initial() : this._(klines: const []);

  const CoinExchangeItemKlinesState.data(List<Kline> klines)
    : this._(klines: klines);

  @override
  final List<Kline> klines;
}
