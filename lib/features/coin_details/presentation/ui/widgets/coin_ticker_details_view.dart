import 'package:auto_size_text/auto_size_text.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/coin_klines_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_last_price_text.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/model/symbol.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinTickerDetailsView extends StatelessWidget {
  const CoinTickerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTokenIcon(),
            _buildTokenName().expanded(),
            Consumer(
              builder: (context, ref, _) {
                final symbol = context.symbol;

                final selectedCoinKline = ref.watch(
                  selectedCoinKlineNotifierProvider,
                );
                final selectedKlinePeriod = ref.read(
                  selectedKlinePeriodNotifierProvider,
                );

                final coinKlinesMap =
                    ref.read(coinKlinesNotifierProvider(symbol)).value;

                final coinKlines = coinKlinesMap?[selectedKlinePeriod] ?? [];

                if (coinKlines.isNotEmpty && selectedCoinKline != null) {
                  return _buildSelectedCoinKlineInfo(
                    selectedCoinKline,
                    coinKlines,
                  );
                }

                return _buildCoinTickerInfo();
              },
            ).expanded(),
          ],
        ).withPadding(12.0, 12.0, 6.0, 12.0),
        const Divider(
          color: AppColors.dividerColor,
          thickness: 1.0,
          height: 1.0,
        ),
      ],
    );
  }

  Widget _buildTokenIcon() {
    return Builder(
      builder: (context) {
        return TokenIcon(symbol: context.symbol, size: 48.0);
      },
    );
  }

  Widget _buildTokenName() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        return AutoSizeText(
          coinMetadata.name,
          style: AppFonts.medium.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 16.0,
          ),
          maxLines: 2,
        );
      },
    );
  }

  Widget _buildSelectedCoinKlineInfo(
    CoinKline selectedCoinKline,
    List<CoinKline> coinKlines,
  ) {
    return Column(
      spacing: 3.0,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildSelectedCoinKlineLastPrice(selectedCoinKline),
        _buildSelectedCoinKlinePriceChange(selectedCoinKline, coinKlines),
      ],
    ).withPaddingOnly(right: 6.0);
  }

  Widget _buildSelectedCoinKlineLastPrice(CoinKline selectedCoinKline) {
    final lastPrice = StringX.formatCurrency(selectedCoinKline.closePrice);

    return Text(
      '\$$lastPrice',
      style: AppFonts.medium.copyWith(
        color: AppColors.primaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildSelectedCoinKlinePriceChange(
    CoinKline selectedCoinKline,
    List<CoinKline> coinKlines,
  ) {
    final initialCoinKline = coinKlines.first;

    final priceChange = StringX.formatCurrency(
      (selectedCoinKline.closePrice - initialCoinKline.closePrice).abs(),
    );
    final priceChangePercent = (((selectedCoinKline.closePrice -
                    initialCoinKline.closePrice) /
                initialCoinKline.closePrice) *
            100.0)
        .abs()
        .toStringAsFixed(2);
    final isPriceNegative =
        (selectedCoinKline.closePrice - initialCoinKline.closePrice).isNegative;

    final priceSign = isPriceNegative ? '-' : '+';

    final priceChangeBuffer =
        StringBuffer()..writeAll([
          '$priceSign$priceChange\$',
          '($priceSign$priceChangePercent%)',
        ], ' ');

    return SizedBox(
      height: 21.0,
      child: Align(
        alignment: Alignment.centerRight,
        child: AutoSizeText(
          '$priceChangeBuffer',
          style: AppFonts.medium.copyWith(
            color:
                isPriceNegative
                    ? AppColors.negativePriceColor
                    : AppColors.positivePriceColor,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.right,
          minFontSize: 10.0,
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _buildCoinTickerInfo() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        ref.watch(
          coinTickerNotifierProvider(
            symbol,
          ).select((coinTicker) => coinTicker?.lastPrice),
        );

        final coinTicker = ref.read(coinTickerNotifierProvider(symbol));

        return Column(
          spacing: 3.0,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (coinTicker != null) _buildCoinLastPrice(coinTicker),
            if (coinTicker != null) _buildCoinPriceChange(coinTicker),
          ],
        );
      },
    );
  }

  Widget _buildCoinLastPrice(CoinTicker coinTicker) {
    return CoinLastPriceText(lastPrice: coinTicker.lastPrice);
  }

  Widget _buildCoinPriceChange(CoinTicker coinTicker) {
    final priceChange = StringX.formatCurrency(coinTicker.priceChange.abs());
    final priceChangePercent = coinTicker.priceChangePercent
        .abs()
        .toStringAsFixed(2);
    final isPriceNegative = coinTicker.priceChange.isNegative;

    final priceSign = isPriceNegative ? '-' : '+';

    final priceChangeBuffer =
        StringBuffer()..writeAll([
          '$priceSign$priceChange\$',
          '($priceSign$priceChangePercent%)',
        ], ' ');

    return SizedBox(
      height: 21.0,
      child: Align(
        alignment: Alignment.centerRight,
        child: AutoSizeText(
          '$priceChangeBuffer',
          style: AppFonts.medium.copyWith(
            color:
                isPriceNegative
                    ? AppColors.negativePriceColor
                    : AppColors.positivePriceColor,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.right,
          minFontSize: 10.0,
          maxLines: 1,
        ),
      ),
    ).withPaddingOnly(right: 6.0);
  }
}
