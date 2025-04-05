import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trade_notifier.dart';
import 'package:crpto/shared/domain/model/enum/trade_type.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentTradeItem extends ConsumerStatefulWidget {
  const RecentTradeItem({super.key, required this.recentTrade});

  final RecentTrade recentTrade;

  @override
  ConsumerState<RecentTradeItem> createState() => _RecentTradeItemState();
}

class _RecentTradeItemState extends ConsumerState<RecentTradeItem> {
  RecentTrade get _recentTrade => widget.recentTrade;

  @override
  Widget build(BuildContext context) {
    final coinMetadata = ref.watch(coinMetadataProvider(_recentTrade.symbol));
    final recentTrade =
        ref.watch(recentTradeNotifierProvider(_recentTrade.symbol)) ??
        _recentTrade;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.shadowColor.withValues(alpha: 0.2),
            offset: const Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
        color: AppColors.primaryWidgetColor,
      ),
      child: Column(
        spacing: 12.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            spacing: 12.0,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                spacing: 12.0,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TokenIcon(token: coinMetadata.baseAsset),
                  Text(
                    coinMetadata.baseAsset,
                    style: AppFonts.medium.copyWith(
                      color: AppColors.primaryTextColor,
                      fontSize: 16.0,
                      height: 1.5,
                    ),
                  ),
                ],
              ).expanded(),
              _buildRecentTradeType(recentTrade),
            ],
          ),
          _buildRecentTradePrice(recentTrade),
          _buildRecentTradeAmount(recentTrade),
        ],
      ),
    );
  }

  Widget _buildRecentTradeType(RecentTrade recentTrade) {
    final tradeType = recentTrade.type;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: (tradeType == TradeType.buy
                ? AppColors.secondaryWidgetColor
                : AppColors.secondaryWidgetColor)
            ,
      ),
      child: Text(
        tradeType.name.toUpperCase(),
        style: AppFonts.semiBold.copyWith(
          color:
              tradeType == TradeType.buy
                  ? AppColors.positivePriceColor
                  : AppColors.negativePriceColor,
          fontSize: 16.0,
          height: 1.0,
        ),
      ),
    );
  }

  Widget _buildRowItem({required String label, required String value}) {
    return SizedBox(
      height: 24.0,
      child: Row(
        spacing: 12.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColors.secondaryWidgetColor,
            ),
            child: Text(
              label.toUpperCase(),
              style: AppFonts.semiBold.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 12.0,
                height: 1.0,
              ),
            ),
          ),
          Text(
            value,
            style: AppFonts.medium.copyWith(
              color: AppColors.primaryTextColor,
              fontSize: 16.0,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTradePrice(RecentTrade recentTrade) {
    final tradePrice = StringX.formatCurrency(
      recentTrade.price * recentTrade.quantity,
    );

    return _buildRowItem(label: 'Price', value: tradePrice);
  }

  Widget _buildRecentTradeAmount(RecentTrade recentTrade) {
    final amount = recentTrade.quantity;

    return _buildRowItem(label: 'Amount', value: '$amount');
  }
}
