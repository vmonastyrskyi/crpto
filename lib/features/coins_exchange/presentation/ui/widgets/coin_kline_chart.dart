import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/coin_klines_notifier.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinKlineChart extends ConsumerStatefulWidget {
  const CoinKlineChart({super.key, required this.symbol});

  final String symbol;

  @override
  ConsumerState<CoinKlineChart> createState() => _CoinKlineChartState();
}

class _CoinKlineChartState extends ConsumerState<CoinKlineChart> {
  @override
  Widget build(BuildContext context) {
    final coinKlinesState = ref.watch(
      coinKlinesProvider(widget.symbol),
    );

    Widget child = _buildNoDataWarning();

    switch (coinKlinesState) {
      case AsyncError<List<CoinKline>>():
        throw UnimplementedError();
      case AsyncLoading(value: final coinKlines):
        if (coinKlines == null || coinKlines.isEmpty) {
          child = SizedBox.shrink(key: UniqueKey());
        } else if (coinKlines.isNotEmpty) {
          child = _buildKlineChart(coinKlines);
        }
      case AsyncData(value: final coinKlines):
        if (coinKlines.isNotEmpty) {
          child = _buildKlineChart(coinKlines);
        }
    }

    return FadeSwitcher(child: child);
  }

  Widget _buildKlineChart(List<CoinKline> klines) {
    final isLastClosePriceHigher =
        klines.last.closePrice > klines.first.closePrice;

    return SizedBox(
      height: 32.0,
      child: LineChart(
        LineChartData(
          lineBarsData: <LineChartBarData>[
            LineChartBarData(
              spots: <FlSpot>[
                for (final kline in klines)
                  FlSpot(klines.indexOf(kline).toDouble(), kline.closePrice),
              ],
              belowBarData: BarAreaData(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    (isLastClosePriceHigher
                            ? context.appColors.positivePriceColor
                            : context.appColors.negativePriceColor)
                        .withValues(alpha: 0.25),
                    (isLastClosePriceHigher
                            ? context.appColors.positivePriceColor
                            : context.appColors.negativePriceColor)
                        .withValues(alpha: 0.0),
                  ],
                ),
                show: true,
              ),
              color: isLastClosePriceHigher
                  ? context.appColors.positivePriceColor
                  : context.appColors.negativePriceColor,
              dotData: const FlDotData(show: false),
              isStrokeJoinRound: true,
              isStrokeCapRound: true,
              isCurved: false,
              barWidth: 1.5,
            ),
          ],
          lineTouchData: const LineTouchData(enabled: false),
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  Widget _buildNoDataWarning() {
    return Center(
      child: Text(
        'No data',
        style: context.appFonts.medium.copyWith(
          color: context.appColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
