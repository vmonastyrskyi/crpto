import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CoinTickerStatsView extends StatelessWidget {
  const CoinTickerStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          spacing: 12.0,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle(),
            Consumer(
              builder: (_, ref, _) {
                final selectedCoinKline = ref.watch(selectedCoinKlineProvider);

                return _buildCoinData(selectedCoinKline);
              },
            ),
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
          '$coinBaseAsset Price information${selectedCoinKline == null ? ' (24h)' : ''}',
          style: AppFonts.semiBold.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 14.0,
          ),
        );
      },
    );
  }

  Widget _buildCoinData(CoinKline? selectedCoinKline) {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        if (selectedCoinKline == null) {
          ref.watch(coinTickerProvider(symbol));
        }

        final coinTicker = ref.read(coinTickerProvider(symbol));

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Row(
              spacing: 24.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  spacing: 12.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildCoinOpenPrice(coinTicker, selectedCoinKline),
                    _buildCoinLowPrice(coinTicker, selectedCoinKline),
                    _buildCoinHighPrice(coinTicker, selectedCoinKline),
                  ],
                ).expanded(),
                Column(
                  spacing: 12.0,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildCoinVolume(coinTicker, selectedCoinKline),
                    _buildCoinQuoteVolume(coinTicker, selectedCoinKline),
                    _buildCoinTradesCount(coinTicker, selectedCoinKline),
                  ],
                ).expanded(),
              ],
            ),
            const Positioned(
              top: 0.0,
              bottom: 0.0,
              child: VerticalDivider(
                color: AppColors.dividerColor,
                thickness: 1.0,
                width: 1.0,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCoinOpenPrice(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinOpenPrice = StringX.formatCurrency(
      selectedCoinKline?.openPrice ?? coinTicker?.openPrice ?? 0.0,
    );

    return _buildRowItem(label: 'Open', value: '\$$coinOpenPrice');
  }

  Widget _buildCoinLowPrice(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinLowPrice = StringX.formatCurrency(
      selectedCoinKline?.lowPrice ?? coinTicker?.lowPrice ?? 0.0,
    );

    return _buildRowItem(label: 'Low', value: '\$$coinLowPrice');
  }

  Widget _buildCoinHighPrice(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinHighPrice = StringX.formatCurrency(
      selectedCoinKline?.highPrice ?? coinTicker?.highPrice ?? 0.0,
    );

    return _buildRowItem(label: 'High', value: '\$$coinHighPrice');
  }

  Widget _buildCoinVolume(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinVolume = NumberFormat.compact().format(
      selectedCoinKline?.volume ?? coinTicker?.volume ?? 0.0,
    );

    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        final coinBaseAsset = coinMetadata.baseAsset;

        return _buildRowItem(
          label: 'Volume ($coinBaseAsset)',
          value: coinVolume,
        );
      },
    );
  }

  Widget _buildCoinQuoteVolume(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinQuoteVolume = NumberFormat.compact().format(
      selectedCoinKline?.quoteVolume ?? coinTicker?.quoteVolume ?? 0.0,
    );

    return _buildRowItem(label: 'Volume (USDT)', value: '\$$coinQuoteVolume');
  }

  Widget _buildCoinTradesCount(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinTradesCount = NumberFormat.compact().format(
      selectedCoinKline?.count ?? coinTicker?.count ?? 0,
    );

    return _buildRowItem(label: 'Trades', value: coinTradesCount);
  }

  Widget _buildRowItem({required String label, required String value}) {
    return Column(
      spacing: 6.0,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 18.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              label,
              style: AppFonts.medium.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 12.0,
              ),
              minFontSize: 8.0,
              maxLines: 1,
            ),
          ),
        ),
        SizedBox(
          height: 21.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              value,
              style: AppFonts.medium.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 14.0,
              ),
              minFontSize: 10.0,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
