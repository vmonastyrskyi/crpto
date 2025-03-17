import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_item/coin_ticker_item_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_klines_chart.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_last_price_text.dart';
import 'package:crpto/shared/domain/model/ticker/coin_ticker.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class CoinTickerItem extends ConsumerStatefulWidget {
  const CoinTickerItem({super.key, required this.coinTicker});

  final CoinTicker coinTicker;

  @override
  ConsumerState<CoinTickerItem> createState() => _CoinTickerListItemState();
}

class _CoinTickerListItemState extends ConsumerState<CoinTickerItem> {
  CoinTicker get _coinTicker => widget.coinTicker;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(
      coinTickerItemControllerProvider(_coinTicker.symbol),
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 10.0, 16.0),
      child: Row(
        spacing: 16.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TokenIcon(token: state.metadata.baseAsset),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                state.metadata.baseAsset,
                style: AppFonts.medium.copyWith(
                  color: AppColors.primaryTextColor,
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
              Text(
                state.metadata.displayName,
                style: AppFonts.regular.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.0,
                  height: 1.5,
                ),
              ),
            ],
          ).expanded(flex: 2),
          CoinKlinesChart(coinTicker: _coinTicker).expanded(flex: 1),
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
      coinTickerItemControllerProvider(_coinTicker.symbol),
    );

    final ticker = state.ticker ?? _coinTicker;

    return CoinLastPriceText(lastPrice: ticker.lastPrice);
  }

  Widget _buildPriceChangePercent() {
    final state = ref.watch(
      coinTickerItemControllerProvider(_coinTicker.symbol),
    );

    final ticker = state.ticker ?? _coinTicker;

    final isPriceChangePercentNegative = ticker.priceChangePercent.isNegative;
    final priceChangePercent = ticker.priceChangePercent.toStringAsFixed(2);

    return Row(
      spacing: 4.0,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SvgPicture.asset(
          isPriceChangePercentNegative
              ? 'assets/svgs/common/arrow_down.svg'
              : 'assets/svgs/common/arrow_up.svg',
          colorFilter: ColorFilter.mode(
            isPriceChangePercentNegative
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
                isPriceChangePercentNegative
                    ? AppColors.negativePriceColor
                    : AppColors.positivePriceColor,
            fontSize: 14.0,
            height: 1.5,
          ),
        ),
      ],
    ).withPaddingOnly(right: 6.0);
  }
}
