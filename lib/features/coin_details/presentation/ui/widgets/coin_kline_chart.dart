import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/coin_klines_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:crpto/shared/domain/model/symbol.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CoinKlineChart extends ConsumerStatefulWidget {
  const CoinKlineChart({super.key, required this.klinePeriod});

  final KlinePeriod klinePeriod;

  @override
  ConsumerState<CoinKlineChart> createState() => _CoinKlinesChartState();
}

class _CoinKlinesChartState extends ConsumerState<CoinKlineChart> {
  final ValueNotifier<List<int>> _showingIndicatorListenable = ValueNotifier(
    const [],
  );

  @override
  Widget build(BuildContext context) {
    final symbol = context.symbol;

    final coinKlinesState = ref.watch(coinKlinesNotifierProvider(symbol));

    Widget child = _buildNoDataWarning();

    switch (coinKlinesState) {
      case AsyncLoading(value: final klinePeriods):
        if (klinePeriods == null || klinePeriods.isEmpty) {
          child = SizedBox.shrink(key: UniqueKey());
        } else if (klinePeriods.isNotEmpty) {
          final coinKlines = klinePeriods[widget.klinePeriod] ?? [];

          child = _buildKlineChart(coinKlines);
        }
      case AsyncData(value: final klinePeriods):
        if (klinePeriods.isNotEmpty) {
          final coinKlines = klinePeriods[widget.klinePeriod] ?? [];

          child = _buildKlineChart(coinKlines);
        }
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: child,
    ).withPaddingAll(12.0);
  }

  @override
  void dispose() {
    _showingIndicatorListenable.dispose();
    super.dispose();
  }

  Widget _buildKlineChart(List<CoinKline> coinKlines) {
    final lastClosePrice = coinKlines.last.closePrice;
    final firstClosePrice = coinKlines.first.closePrice;

    final isLastClosePriceHigher = lastClosePrice > firstClosePrice;

    final minClosePrice = coinKlines
        .map((coinKline) => coinKline.closePrice)
        .reduce(min);
    final maxClosePrice = coinKlines
        .map((coinKline) => coinKline.closePrice)
        .reduce(max);

    final (minY, maxY, horizontalInterval) = _calculateMinMaxRange(
      minClosePrice,
      maxClosePrice,
    );

    return ValueListenableBuilder(
      valueListenable: _showingIndicatorListenable,
      builder: (_, showingIndicators, _) {
        return Consumer(
          builder: (_, ref, _) {
            final selectedCoinKline = ref.watch(
              selectedCoinKlineNotifierProvider,
            );
            final selectedKlinePeriod = ref.watch(
              selectedKlinePeriodNotifierProvider,
            );

            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: <Widget>[
                LineChart(
                  LineChartData(
                    lineBarsData: <LineChartBarData>[
                      LineChartBarData(
                        showingIndicators: showingIndicators,
                        spots: <FlSpot>[
                          for (final coinKline in coinKlines)
                            FlSpot(
                              coinKlines.indexOf(coinKline).toDouble(),
                              coinKline.closePrice,
                            ),
                        ],
                        belowBarData: BarAreaData(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              (isLastClosePriceHigher
                                      ? AppColors.positivePriceColor
                                      : AppColors.negativePriceColor)
                                  .withValues(alpha: 0.25),
                              (isLastClosePriceHigher
                                      ? AppColors.positivePriceColor
                                      : AppColors.negativePriceColor)
                                  .withValues(alpha: 0.0),
                            ],
                          ),
                          show: true,
                        ),
                        color:
                            isLastClosePriceHigher
                                ? AppColors.positivePriceColor
                                : AppColors.negativePriceColor,
                        dotData: const FlDotData(show: false),
                        isStrokeJoinRound: true,
                        isStrokeCapRound: true,
                        isCurved: false,
                        barWidth: 1.5,
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchCallback: (touchEvent, lineTouchResponse) {
                        switch (touchEvent) {
                          case FlPanDownEvent() ||
                              FlPanStartEvent() ||
                              FlPanUpdateEvent():
                            if (lineTouchResponse == null) return;

                            final lineBarSpots = lineTouchResponse.lineBarSpots;

                            if (lineBarSpots == null || lineBarSpots.isEmpty) {
                              return;
                            }

                            int spotIndex = lineBarSpots.first.spotIndex;

                            if (spotIndex == 0) {
                              spotIndex++;
                            } else if (spotIndex == coinKlines.length - 1) {
                              spotIndex--;
                            }

                            ref
                                .read(
                                  selectedCoinKlineNotifierProvider.notifier,
                                )
                                .select(coinKlines[spotIndex]);

                            _showingIndicatorListenable.value = [spotIndex];
                          case FlPanCancelEvent() || FlPanEndEvent():
                            ref
                                .read(
                                  selectedCoinKlineNotifierProvider.notifier,
                                )
                                .select(null);

                            _showingIndicatorListenable.value = const [];
                        }
                      },
                      getTouchedSpotIndicator: (_, spotIndexes) {
                        final initialCoinKlineClosePrice =
                            coinKlines.first.closePrice;

                        return <TouchedSpotIndicatorData>[
                          ...spotIndexes.map((spotIndex) {
                            final selectedCoinKlineClosePrice =
                                coinKlines[spotIndex].closePrice;

                            final lineColor =
                                initialCoinKlineClosePrice <=
                                        selectedCoinKlineClosePrice
                                    ? AppColors.positivePriceColor
                                    : AppColors.negativePriceColor;

                            return TouchedSpotIndicatorData(
                              FlLine(
                                color: lineColor,
                                dashArray: [4, 4],
                                strokeWidth: 1.0,
                              ),
                              const FlDotData(show: false),
                            );
                          }),
                        ];
                      },
                      touchTooltipData: LineTouchTooltipData(
                        getTooltipItems: (touchedSpots) {
                          return <LineTooltipItem>[
                            ...touchedSpots.map(
                              (_) => const LineTooltipItem(
                                emptyString,
                                TextStyle(color: AppColors.transparent),
                              ),
                            ),
                          ];
                        },
                        getTooltipColor: (_) => AppColors.transparent,
                      ),
                      getTouchLineStart: (_, _) => -double.infinity,
                      getTouchLineEnd: (_, _) => double.infinity,
                      longPressDuration: const Duration(days: 1),
                      handleBuiltInTouches: false,
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          getTitlesWidget: _buildCoinPriceLabel,
                          interval: horizontalInterval,
                          reservedSize: 52.0,
                          showTitles: true,
                        ),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      show: true,
                    ),
                    gridData: FlGridData(
                      horizontalInterval: horizontalInterval,
                      getDrawingHorizontalLine:
                          (_) => const FlLine(
                            color: AppColors.dividerColorDark,
                            dashArray: [6, 3],
                            strokeWidth: 0.5,
                          ),
                      drawVerticalLine: false,
                    ),
                    minY: minY,
                    maxY: maxY,
                  ),
                ),

                if (coinKlines.isNotEmpty && selectedCoinKline != null)
                  Positioned(
                    top: -9.0,
                    right: 0.0,
                    child: _buildSelectedCoinKlineCloseDate(
                      selectedCoinKline,
                      selectedKlinePeriod,
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildSelectedCoinKlineCloseDate(
    CoinKline selectedCoinKline,
    KlinePeriod selectedKlinePeriod,
  ) {
    final closeDate = DateFormat.yMMMd().format(
      selectedCoinKline.closeTime.add(const Duration(seconds: 1)),
    );
    final closeTime = DateFormat.jm().format(
      selectedCoinKline.closeTime.add(const Duration(seconds: 1)),
    );

    final showCloseTime =
        selectedKlinePeriod == KlinePeriod.oneHour ||
        selectedKlinePeriod == KlinePeriod.oneDay ||
        selectedKlinePeriod == KlinePeriod.oneWeek ||
        selectedKlinePeriod == KlinePeriod.oneMonth;

    return Container(
      padding: const EdgeInsets.only(left: 4.0),
      color: AppColors.bodyBackgroundColor,
      child: Text(
        '$closeDate${showCloseTime ? ' $closeTime' : ''}',
        style: AppFonts.medium.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 12.0,
        ),
      ),
    );
  }

  Widget _buildCoinPriceLabel(double value, TitleMeta meta) {
    return AutoSizeText(
      '\$${NumberFormat.compact().format(value)}',
      style: AppFonts.medium.copyWith(
        color: AppColors.secondaryTextColor,
        fontSize: 12.0,
      ),
      textAlign: TextAlign.center,
      minFontSize: 8.0,
      maxLines: 1,
    ).withPaddingOnly(right: 12.0);
  }

  Widget _buildNoDataWarning() {
    return Center(
      child: Text(
        'No data',
        style: AppFonts.medium.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}

(double, double, double) _calculateMinMaxRange(
  double minValue,
  double maxValue,
) {
  final rangeValue = Decimal.parse('$maxValue') - Decimal.parse('$minValue');

  final logRange =
      rangeValue.toDouble() == 0.0
          ? 0.0
          : _log10(rangeValue.toDouble()).floorToDouble();

  final step = (Decimal.parse('${pow(10, logRange)}').toDouble());

  double min =
      (Decimal.parse('$step') *
              Decimal.parse('${((minValue / step).floor() - 1.0)}'))
          .toDouble();
  double max =
      (Decimal.parse('$step') *
              Decimal.parse('${((maxValue / step).ceil() + 1.0)}'))
          .toDouble();

  min = min < 0.0 ? 0.0 : min;

  if (min > minValue) {
    min -= step;
  }

  if (max < maxValue) {
    max += step;
  }

  return (min, max, step);
}

double _log10(double x) => log(x) / log(10);
