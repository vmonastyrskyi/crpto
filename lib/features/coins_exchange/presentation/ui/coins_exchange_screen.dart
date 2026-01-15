import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trades_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_list_view.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_list_view.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/foundation.dart';
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
        color: context.appColors.backgroundColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: UnfocusTapArea(
            child: SafeArea(
              minimum: kIsWeb
                  ? const EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 0.0)
                  : EdgeInsets.zero,
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
          color: context.appColors.backgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(child: _buildAppBarTitle()),
              Positioned(right: 0.0, child: _buildManageCoinsButton()),
            ],
          ),
        ),
      ).withPadding(kIsWeb ? 8.0 : 0.0, 0.0, kIsWeb ? 8.0 : 0.0, 0.0),
    );
  }

  Widget _buildAppBarTitle() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'crp',
              style: context.appFonts.bold.copyWith(
                color: context.appColors.primaryTextColor,
                fontSize: 20.0,
              ),
            ),
            TextSpan(
              text: 'to',
              style: context.appFonts.bold.copyWith(
                color: context.appColors.primaryColor,
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
      highlightColor: context.appColors.splashColorLight,
      hoverColor: context.appColors.splashColorDark,
      color: context.appColors.iconColor,
      icon: const Icon(Icons.settings),
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<HeaderBuilderNotifier>().innerBoxIsScrolled =
              innerBoxIsScrolled;
        });

        final recentTradesState = ref.watch(recentTradesProvider);

        if (recentTradesState.value?.isEmpty ?? true) return const <Widget>[];

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
