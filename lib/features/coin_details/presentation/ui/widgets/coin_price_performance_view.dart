import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinPricePerformanceView extends StatelessWidget {
  const CoinPricePerformanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          spacing: 8.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildCoinLowPriceLabel(),
                _buildCoinHighPriceLabel(),
              ],
            ),
            _buildPricePerformancePainter(),
          ],
        ).withPaddingAll(12.0),
        const Divider(
          color: AppColors.dividerColor,
          thickness: 1.0,
          height: 1.0,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));
        final selectedCoinKline = ref.watch(selectedCoinKlineProvider);

        final coinBaseAsset = coinMetadata.baseAsset;

        return Text(
          '$coinBaseAsset Price performance${selectedCoinKline == null ? ' (24h)' : ''}',
          style: AppFonts.semiBold.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 14.0,
          ),
        );
      },
    );
  }

  Widget _buildCoinLowPriceLabel() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final selectedCoinKline = ref.watch(selectedCoinKlineProvider);

        if (selectedCoinKline == null) {
          ref.watch(
            coinTickerProvider(
              symbol,
            ).select((coinTicker) => coinTicker?.lowPrice),
          );
        }

        final coinTicker = ref.read(coinTickerProvider(symbol));

        final formattedLowPrice = StringX.formatCurrency(
          selectedCoinKline?.lowPrice ?? coinTicker?.lowPrice ?? 0.0,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Low',
              style: AppFonts.medium.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 12.0,
              ),
            ),
            Text(
              '\$$formattedLowPrice',
              style: AppFonts.medium.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 14.0,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCoinHighPriceLabel() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final selectedCoinKline = ref.watch(selectedCoinKlineProvider);

        if (selectedCoinKline == null) {
          ref.watch(
            coinTickerProvider(
              symbol,
            ).select((coinTicker) => coinTicker?.highPrice),
          );
        }

        final coinTicker = ref.read(coinTickerProvider(symbol));

        final formattedHighPrice = StringX.formatCurrency(
          selectedCoinKline?.highPrice ?? coinTicker?.highPrice ?? 0.0,
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'High',
              style: AppFonts.medium.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.end,
            ),
            Text(
              '\$$formattedHighPrice',
              style: AppFonts.medium.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPricePerformancePainter() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final selectedCoinKline = ref.watch(selectedCoinKlineProvider);

        if (selectedCoinKline != null) {
          final lowPrice = selectedCoinKline.lowPrice;
          final highPrice = selectedCoinKline.highPrice;
          final lastPrice = selectedCoinKline.closePrice;

          return _PricePerformanceSlider(
            minValue: lowPrice,
            maxValue: highPrice,
            value: lastPrice,
          );
        }

        ref.watch(
          coinTickerProvider(
            symbol,
          ).select((coinTicker) => coinTicker?.lastPrice),
        );

        final coinTicker = ref.read(coinTickerProvider(symbol));

        final lowPrice = coinTicker?.lowPrice ?? 0.0;
        final highPrice = coinTicker?.highPrice ?? 0.0;
        final lastPrice = coinTicker?.lastPrice ?? 0.0;

        return _AnimatedPricePerformanceSlider(
          minValue: lowPrice,
          maxValue: highPrice,
          value: lastPrice,
        );
      },
    );
  }
}

class _AnimatedPricePerformanceSlider extends StatefulWidget {
  const _AnimatedPricePerformanceSlider({
    required this.minValue,
    required this.maxValue,
    required this.value,
  });

  final double minValue;
  final double maxValue;
  final double value;

  @override
  State<_AnimatedPricePerformanceSlider> createState() =>
      _AnimatedPricePerformanceSliderState();
}

class _AnimatedPricePerformanceSliderState
    extends State<_AnimatedPricePerformanceSlider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _fastOutSlowInAnimation;

  late Animation<double> _valueAnimation;

  double _previousValue = 0.0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    )..addListener(() => setState(() {}));

    _fastOutSlowInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    _valueAnimation = Tween<double>(
      begin: widget.value,
      end: widget.value,
    ).animate(_fastOutSlowInAnimation);

    _previousValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant _AnimatedPricePerformanceSlider oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_previousValue != widget.value) {
      _valueAnimation = Tween<double>(
        begin: _previousValue,
        end: widget.value,
      ).animate(_fastOutSlowInAnimation);

      _animationController.forward(from: 0.0);

      _previousValue = widget.value;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _PricePerformanceSlider(
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      value: _valueAnimation.value,
    );
  }
}

class _PricePerformanceSlider extends StatelessWidget {
  const _PricePerformanceSlider({
    required this.minValue,
    required this.maxValue,
    required this.value,
  });

  final double minValue;
  final double maxValue;
  final double value;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 3.0),
      painter: _PricePerformancePainter(
        minValue: minValue,
        maxValue: maxValue,
        value: value,
      ),
    );
  }
}

class _PricePerformancePainter extends CustomPainter {
  const _PricePerformancePainter({
    required this.minValue,
    required this.maxValue,
    required this.value,
  });

  final double minValue;
  final double maxValue;
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    const indicatorWidth = 2.0;
    const indicatorHeight = 12.0;
    final sliderWidth = size.width;
    final sliderHeight = size.height;

    final indicatorPaint = Paint()
      ..color = AppColors.secondaryTextColor
      ..strokeWidth = indicatorWidth
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;
    final sliderPaint = Paint()
      ..color = AppColors.secondaryWidgetColor
      ..strokeWidth = sliderHeight
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(0.0 + (sliderHeight / 2.0), sliderHeight / 2.0),
      Offset(sliderWidth - (sliderHeight / 2.0), sliderHeight / 2.0),
      sliderPaint,
    );

    final normalizedValue = ((value - minValue) / (maxValue - minValue)).clamp(
      0.0,
      1.0,
    );

    final indicatorX =
        (indicatorWidth / 2.0) +
        normalizedValue * (sliderWidth - indicatorWidth);

    canvas.drawLine(
      Offset(
        indicatorX,
        (sliderHeight / 2.0) - (indicatorHeight / 2.0) + (indicatorWidth / 2.0),
      ),
      Offset(
        indicatorX,
        (sliderHeight / 2.0) + (indicatorHeight / 2.0) - (indicatorWidth / 2.0),
      ),
      indicatorPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _PricePerformancePainter oldDelegate) {
    return minValue != oldDelegate.minValue ||
        maxValue != oldDelegate.maxValue ||
        value != oldDelegate.value;
  }
}
