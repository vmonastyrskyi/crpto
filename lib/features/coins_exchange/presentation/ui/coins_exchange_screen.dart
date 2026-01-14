import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_list_view.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_list_view.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CoinsExchangeScreen extends ConsumerStatefulWidget {
  const CoinsExchangeScreen({super.key});

  @override
  ConsumerState<CoinsExchangeScreen> createState() =>
      _CoinsExchangeScreenState();
}

class _CoinsExchangeScreenState extends ConsumerState<CoinsExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider(create: (_) => HeaderBuilderNotifier()),
      ],
      child: Container(
        color: AppColors.backgroundColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: UnfocusTapArea(
            child: SafeArea(
              bottom: false,
              child: Scaffold(appBar: _buildAppBar(), body: _buildBody()),
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

  Widget _buildBody() {
    return NestedScrollView(
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<HeaderBuilderNotifier>().innerBoxIsScrolled =
              innerBoxIsScrolled;
        });

        return <Widget>[const SliverToBoxAdapter(child: RecentTradeListView())];
      },
      body: const CoinTickerListView(),
    );
  }
}

class HeaderBuilderNotifier extends ChangeNotifier {
  bool _innerBoxIsScrolled = false;

  bool get innerBoxIsScrolled => _innerBoxIsScrolled;

  set innerBoxIsScrolled(bool value) {
    _innerBoxIsScrolled = value;

    notifyListeners();
  }
}
