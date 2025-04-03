import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/selected_coin_kline_notifier.g.dart';

@riverpod
class SelectedCoinKlineNotifier extends _$SelectedCoinKlineNotifier {
  @override
  CoinKline? build() => null;

  void select(CoinKline? coinKline) {
    state = coinKline;
  }
}
