import 'package:auto_size_text/auto_size_text.dart';
import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/app_resources.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_kline_chart.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_last_price_text.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CoinTickerItem extends StatelessWidget {
  const CoinTickerItem({super.key, required this.coinTicker});

  final CoinTicker coinTicker;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final partParameters = <String, String>{'symbol': coinTicker.symbol};

        context.pushNamed(
          pathParameters: partParameters,
          RouteNames.coinDetails,
        );
      },
      highlightColor: AppColors.splashColorDark,
      splashColor: AppColors.splashColorDark,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 12.0, 6.0, 12.0),
        child: Row(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTokenIcon(),
            Column(
              spacing: 3.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTokenBaseAsset(),
                _buildTokenDisplayName(),
              ],
            ).expanded(flex: 2),
            CoinKlineChart(symbol: coinTicker.symbol).expanded(flex: 1),
            Column(
              spacing: 3.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _buildCoinLastPrice(),
                _buildCoinPriceChangePercent(),
              ],
            ).expanded(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTokenIcon() {
    return Consumer(
      builder: (_, ref, _) {
        final coinMetadata = ref.watch(coinMetadataProvider(coinTicker.symbol));

        return TokenIcon(token: coinMetadata.baseAsset);
      },
    );
  }

  Widget _buildTokenBaseAsset() {
    return Consumer(
      builder: (_, ref, _) {
        final coinMetadata = ref.watch(coinMetadataProvider(coinTicker.symbol));

        return AutoSizeText(
          coinMetadata.baseAsset,
          style: AppFonts.medium.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 16.0,
          ),
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildTokenDisplayName() {
    return Consumer(
      builder: (_, ref, _) {
        final coinMetadata = ref.watch(coinMetadataProvider(coinTicker.symbol));

        return AutoSizeText(
          coinMetadata.displayName,
          style: AppFonts.medium.copyWith(
            color: AppColors.secondaryTextColor,
            fontSize: 14.0,
          ),
          minFontSize: 8.0,
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildCoinLastPrice() {
    return Consumer(
      builder: (_, ref, _) {
        final coinTicker =
            ref.watch(coinTickerNotifierProvider(this.coinTicker.symbol)) ??
            this.coinTicker;

        return CoinLastPriceText(lastPrice: coinTicker.lastPrice);
      },
    );
  }

  Widget _buildCoinPriceChangePercent() {
    return Consumer(
      builder: (_, ref, _) {
        final coinTicker =
            ref.watch(coinTickerNotifierProvider(this.coinTicker.symbol)) ??
            this.coinTicker;

        final priceChangePercent = coinTicker.priceChangePercent
            .toStringAsFixed(2);
        final isPriceChangeNegative = coinTicker.priceChange.isNegative;

        return Row(
          spacing: 4.0,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              isPriceChangeNegative
                  ? AppResources.arrowDown
                  : AppResources.arrowUp,
              colorFilter: ColorFilter.mode(
                isPriceChangeNegative
                    ? AppColors.negativePriceColor
                    : AppColors.positivePriceColor,
                BlendMode.srcIn,
              ),
              width: 8.0,
            ),
            Text(
              '$priceChangePercent%',
              style: AppFonts.medium.copyWith(
                color:
                    isPriceChangeNegative
                        ? AppColors.negativePriceColor
                        : AppColors.positivePriceColor,
                fontSize: 14.0,
                height: 1.5,
              ),
            ),
          ],
        );
      },
    ).withPaddingOnly(right: 6.0);
  }
}
