import 'package:crpto/shared/domain/model/kline/kline.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/coin_kline_list_state.freezed.dart';

@freezed
class CoinKlineListState with _$CoinKlineListState {
  const CoinKlineListState._({required this.klines});

  const CoinKlineListState.initial() : this._(klines: const []);

  const CoinKlineListState.data({required List<Kline> klines})
    : this._(klines: klines);

  @override
  final List<Kline> klines;
}
