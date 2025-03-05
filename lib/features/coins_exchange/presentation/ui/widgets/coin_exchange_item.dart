import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/item/coin_exchange_item_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/item/klines/coin_exchange_item_klines_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/item/klines/coin_exchange_item_klines_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CoinExchangeItem extends ConsumerStatefulWidget {
  const CoinExchangeItem({super.key, required this.coinExchangeStats});

  final CoinExchangeStats coinExchangeStats;

  @override
  ConsumerState<CoinExchangeItem> createState() => _CoinExchangeListItemState();
}

class _CoinExchangeListItemState extends ConsumerState<CoinExchangeItem> {
  CoinExchangeStats get _coinExchangeStats => widget.coinExchangeStats;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      coinExchangeItemControllerProvider(_coinExchangeStats),
    );

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (state.metadata.hasIcon)
            VectorGraphic(
              width: 40.0,
              height: 40.0,
              loader: AssetBytesLoader(
                CryptoUtils.getSvgVecPath(state.metadata.baseAsset),
              ),
            ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                state.metadata.baseAsset,
                style: AppFonts.medium.copyWith(
                  color: AppColors.primaryTextColor,
                  fontSize: 16.0,
                ),
              ),
              Text(
                state.metadata.displayName,
                style: AppFonts.regular.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          ).expanded(flex: 2),
          const SizedBox(width: 16.0),
          _CoinKlinesChart(
            coinExchangeStats: _coinExchangeStats,
          ).expanded(flex: 1),
          const SizedBox(width: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[_buildLastPrice(), _buildPriceChangePercent()],
          ).expanded(flex: 2),
        ],
      ),
    );
  }

  Widget _buildLastPrice() {
    final state = ref.watch(
      coinExchangeItemControllerProvider(_coinExchangeStats),
    );

    final lastPrice = StringX.formatCurrency(state.coinExchangeStats.lastPrice);

    return Text(
      '\$$lastPrice',
      style: AppFonts.medium.copyWith(
        color: AppColors.primaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildPriceChangePercent() {
    final state = ref.watch(
      coinExchangeItemControllerProvider(_coinExchangeStats),
    );

    final isPriceChangePercentNegative =
        state.coinExchangeStats.priceChangePercent.isNegative;
    final priceChangePercent = state.coinExchangeStats.priceChangePercent
        .toStringAsFixed(2);

    return Text(
      '$priceChangePercent%',
      style: AppFonts.medium.copyWith(
        color:
            isPriceChangePercentNegative
                ? AppColors.negativePriceColor
                : AppColors.positivePriceColor,
        fontSize: 14.0,
      ),
    );
  }
}

class _CoinKlinesChart extends ConsumerStatefulWidget {
  const _CoinKlinesChart({required this.coinExchangeStats});

  final CoinExchangeStats coinExchangeStats;

  @override
  ConsumerState<_CoinKlinesChart> createState() => _CoinKlinesChartState();
}

class _CoinKlinesChartState extends ConsumerState<_CoinKlinesChart> {
  CoinExchangeStats get _coinExchangeStats => widget.coinExchangeStats;

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(
      coinExchangeItemKlinesControllerProvider(_coinExchangeStats.symbol),
    );

    switch (asyncState) {
      case AsyncLoading(value: final state):
        if (state == null || state.klines.isEmpty) {
          return _buildLoadingIndicator();
        }

        if (state.klines.isNotEmpty) {
          return _buildKlinesChart(state);
        }
      case AsyncData(value: final state):
        if (state.klines.isNotEmpty) {
          return _buildKlinesChart(state);
        }
    }

    return _buildNoDataWarning();
  }

  Widget _buildKlinesChart(CoinExchangeItemKlinesState state) {
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
