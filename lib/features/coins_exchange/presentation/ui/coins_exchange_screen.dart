import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/unfocus_tap_area.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_exchange_list.dart';
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
  CoinsExchangeController get _coinsExchangeController =>
      ref.coinsExchangeController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _coinsExchangeController.loadCoinsExchangeStats();
    });
  }

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
              body: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      context.pushNamed(RouteNames.coinsManagement);
                    },
                    child: const Text('Go to Coins Screen'),
                  ),
                  const CoinExchangeList().expanded,
                ],
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[_buildAppBarTitle().expanded],
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'crpto',
          style: AppFonts.bold.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}
