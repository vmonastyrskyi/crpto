import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_item/recent_trade_item_controller.dart';
import 'package:crpto/shared/domain/model/trade_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

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
    final state = ref.watch(
      recentTradeItemControllerProvider(_recentTrade.symbol),
    );

    final recentTrade = state.recentTrade ?? _recentTrade;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0xFF181818),
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
        color: AppColors.widgetBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
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
              const SizedBox(width: 8.0),
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
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            '\$${StringX.formatCurrency(recentTrade.price)}',
            style: AppFonts.medium.copyWith(
              color: AppColors.primaryTextColor,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'P: \$${StringX.formatCurrency(recentTrade.price * recentTrade.quantity)}',
            style: AppFonts.medium.copyWith(
              color: AppColors.primaryTextColor,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8.0,
            children: [
              Text(
                'A: ${recentTrade.quantity}',
                style: AppFonts.medium.copyWith(
                  color: AppColors.primaryTextColor,
                  fontSize: 16.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: (recentTrade.type == TradeType.buy
                          ? AppColors.positivePriceColor
                          : AppColors.negativePriceColor)
                      .withValues(alpha: 0.25),
                ),
                child: Center(
                  child: Text(
                    recentTrade.type.name.toUpperCase(),
                    style: AppFonts.semiBold.copyWith(
                      color:
                          recentTrade.type == TradeType.buy
                              ? AppColors.positivePriceColor
                              : AppColors.negativePriceColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
