import 'package:auto_size_text/auto_size_text.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/domain/model/symbol.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class CoinTickerStatsView extends StatelessWidget {
  const CoinTickerStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Consumer(
          builder: (_, ref, _) {
            final selectedCoinKline = ref.watch(
              selectedCoinKlineNotifierProvider,
            );

            return _buildCoinData(selectedCoinKline);
          },
        ),
        const Divider(
          color: AppColors.dividerColorDark,
          thickness: 1.0,
          height: 1.0,
        ),
      ],
    );
  }

  Widget _buildCoinData(CoinKline? selectedCoinKline) {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        if (selectedCoinKline == null) {
          ref.watch(coinTickerNotifierProvider(symbol));
        }

        final coinTicker = ref.read(coinTickerNotifierProvider(symbol));

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildCoinOpenPrice(coinTicker, selectedCoinKline),
            _buildCoinLowPrice(coinTicker, selectedCoinKline),
            _buildCoinHighPrice(coinTicker, selectedCoinKline),
            _buildCoinQuoteVolume(coinTicker, selectedCoinKline),
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

  Widget _buildCoinQuoteVolume(
    CoinTicker? coinTicker,
    CoinKline? selectedCoinKline,
  ) {
    final coinQuoteVolume = NumberFormat.compact().format(
      selectedCoinKline?.quoteVolume ?? coinTicker?.quoteVolume ?? 0.0,
    );

    return _buildRowItem(label: 'Volume', value: coinQuoteVolume);
  }

  Widget _buildRowItem({required String label, required String value}) {
    return Column(
      spacing: 6.0,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: AppFonts.medium.copyWith(
            color: AppColors.secondaryTextColor,
            fontSize: 14.0,
          ),
        ),
        SizedBox(
          height: 24.0,
          child: Center(
            child: AutoSizeText(
              value,
              style: AppFonts.medium.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 16.0,
              ),
              minFontSize: 10.0,
              maxLines: 1,
            ),
          ),
        ),
      ],
    ).withPadding(12.0, 0.0, 12.0, 12.0).expanded();
  }
}
