import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange/coin_exchange_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CoinExchangeListItem extends ConsumerStatefulWidget {
  const CoinExchangeListItem({super.key, required this.coinExchangeStats});

  final CoinExchangeStats coinExchangeStats;

  @override
  ConsumerState<CoinExchangeListItem> createState() =>
      _CoinExchangeListItemState();
}

class _CoinExchangeListItemState extends ConsumerState<CoinExchangeListItem> {
  CoinExchangeControllerProvider get _coinExchangeControllerProvider =>
      coinExchangeControllerProvider(widget.coinExchangeStats);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_coinExchangeControllerProvider);

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
                style: AppFonts.medium.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.0,
                ),
              ),
            ],
          ).expanded,
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[_buildLastPrice(), _buildPriceChangePercent()],
          ),
        ],
      ),
    );
  }

  Widget _buildLastPrice() {
    final state = ref.watch(_coinExchangeControllerProvider);

    final lastPrice = state.exchangeStats.lastPrice.toStringAsFixed(2);

    return Text(
      '\$$lastPrice',
      style: AppFonts.medium.copyWith(
        color: AppColors.primaryTextColor,
        fontSize: 16.0,
      ),
    );
  }

  Widget _buildPriceChangePercent() {
    final state = ref.watch(_coinExchangeControllerProvider);

    final isPriceChangePercentNegative =
        state.exchangeStats.priceChangePercent.isNegative;
    final priceChangePercent = state.exchangeStats.priceChangePercent
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
