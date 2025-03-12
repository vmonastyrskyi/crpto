import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/unfocus_tap_area.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_exchange_list/coin_exchange_list_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_exchange_list.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_list.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
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
      color: AppColors.bodyBackgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: UnfocusTapArea(
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: _buildAppBar(),
              body: CustomMaterialIndicator(
                displacement: 16.0,
                color: AppColors.bodyBackgroundColor,
                backgroundColor: AppColors.primaryTextColor,
                trailingScrollIndicatorVisible: false,
                onRefresh:
                    ref
                        .read(coinExchangeListControllerProvider.notifier)
                        .refreshCoinsExchangeStats,
                child: Column(
                  children: <Widget>[
                    const RecentTradeList(),
                    const CoinExchangeList().expanded(),
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
          color: AppColors.bodyBackgroundColor,
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
              ),
            ),
            TextSpan(
              text: 'to',
              style: AppFonts.bold.copyWith(
                color: AppColors.primaryColor,
                fontSize: 20.0,
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
