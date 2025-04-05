import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trades_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_list_view.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_list_view.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/shimmer_wrapper.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoinsExchangeScreen extends ConsumerStatefulWidget {
  const CoinsExchangeScreen({super.key});

  @override
  ConsumerState<CoinsExchangeScreen> createState() =>
      _CoinsExchangeScreenState();
}

class _CoinsExchangeScreenState extends ConsumerState<CoinsExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: UnfocusTapArea(
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: _buildAppBar(),
              body: Consumer(
                builder: (_, ref, child) {
                  final recentTrades =
                      ref.watch(recentTradesNotifierProvider).value;
                  final coinTickers =
                      ref.watch(coinTickersNotifierProvider).value;

                  return FadeSwitcher(
                    child:
                        recentTrades == null ||
                                recentTrades.isEmpty ||
                                coinTickers == null ||
                                coinTickers.isEmpty
                            ? ShimmerWrapper(child: child!)
                            : child!,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const RecentTradeListView(),
                    const CoinTickerListView().expanded(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(double.maxFinite),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(56.0),
        child: Container(
          color: AppColors.backgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(child: _buildAppBarTitle()),
              Positioned(right: 0.0, child: _buildManageCoinsButton()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'crp',
              style: AppFonts.bold.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 20.0,
                height: 1.6,
              ),
            ),
            TextSpan(
              text: 'to',
              style: AppFonts.bold.copyWith(
                color: AppColors.primaryColor,
                fontSize: 20.0,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildManageCoinsButton() {
    return IconButton(
      onPressed: () => context.pushNamed(RouteNames.coinsManagement),
      icon: const Icon(Icons.settings),
      color: AppColors.iconColor,
    );
  }
}
