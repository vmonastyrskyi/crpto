import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_kline_list/coin_kline_list_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_kline_list/coin_kline_list_state.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinKlinesChart extends ConsumerStatefulWidget {
  const CoinKlinesChart({super.key, required this.coinTicker});

  final CoinTicker coinTicker;

  @override
  ConsumerState<CoinKlinesChart> createState() => _CoinKlinesChartState();
}

class _CoinKlinesChartState extends ConsumerState<CoinKlinesChart> {
  CoinTicker get _coinTicker => widget.coinTicker;

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(
      coinKlineListControllerProvider(_coinTicker.symbol),
    );

    switch (asyncState) {
      case AsyncLoading(value: final state):
        if (state == null || state.klines.isEmpty) {
          return _buildLoadingIndicator();
        }

        if (state.klines.isNotEmpty) {
          return _buildKlineChart(state);
        }
      case AsyncData(value: final state):
        if (state.klines.isNotEmpty) {
          return _buildKlineChart(state);
        }
    }

    return _buildNoDataWarning();
  }

  Widget _buildKlineChart(CoinKlineListState state) {
    final klines = state.klines;

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
                  colors: <Color>[
                    (isLastClosePriceHigher
                            ? AppColors.positivePriceColor
                            : AppColors.negativePriceColor)
                        .withValues(alpha: 0.125),
                    (isLastClosePriceHigher
                            ? AppColors.positivePriceColor
                            : AppColors.negativePriceColor)
                        .withValues(alpha: 0.5),
                  ],
                ),
                show: true,
              ),
              color:
                  isLastClosePriceHigher
                      ? AppColors.positivePriceColor
                      : AppColors.negativePriceColor,
              dotData: const FlDotData(show: false),
              preventCurveOverShooting: true,
              isStrokeJoinRound: true,
              isStrokeCapRound: true,
              isCurved: true,
              barWidth: 2.0,
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

  Widget _buildLoadingIndicator() {
    return const Center(
      child: SizedBox.square(
        dimension: 24.0,
        child: CircularProgressIndicator(
          color: AppColors.primaryTextColor,
          strokeWidth: 2.0,
        ),
      ),
    );
  }

  Widget _buildNoDataWarning() {
    return Center(
      child: Text(
        'No data',
        style: AppFonts.regular.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
