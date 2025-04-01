import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/selected_kline_period_notifier.g.dart';

@riverpod
class SelectedKlinePeriodNotifier extends _$SelectedKlinePeriodNotifier {
  @override
  KlinePeriod build() => KlinePeriod.oneDay;

  void select(KlinePeriod klinePeriod) {
    state = klinePeriod;
  }
}
