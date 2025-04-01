import 'package:auto_size_text/auto_size_text.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/unfocus_tap_area.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_kline_chart.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_ticker_details_view.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_ticker_stats_view.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:crpto/shared/domain/model/symbol.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:provider/provider.dart' hide Consumer;

class CoinDetailsScreen extends ConsumerStatefulWidget {
  const CoinDetailsScreen({super.key, required this.symbol});

  final String symbol;

  @override
  ConsumerState<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends ConsumerState<CoinDetailsScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    final selectedKlinePeriod = ref.read(selectedKlinePeriodNotifierProvider);

    _pageController = PageController(
      initialPage: KlinePeriod.values.indexOf(selectedKlinePeriod),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(selectedCoinKlineNotifierProvider, (
      prevSelectedCoinKline,
      nextSelectedCoinKline,
    ) {
      if (prevSelectedCoinKline == nextSelectedCoinKline) return;

      HapticFeedback.lightImpact();
    });

    return Provider.value(
      value: Symbol(widget.symbol),
      child: Container(
        color: AppColors.bodyBackgroundColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: UnfocusTapArea(
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                appBar: _buildAppBar(),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const CoinTickerDetailsView(),
                      const CoinTickerStatsView(),
                      const SizedBox(height: 12.0),
                      _buildKlineChart(),
                      const SizedBox(height: 12.0),
                      _buildKlinePeriodSelector(),
                    ],
                  ),
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
              Positioned(
                left: 0.0,
                child: const BackButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
                  ),
                  color: AppColors.iconColor,
                ).withPaddingAll(4.0),
              ),
              Center(child: _buildAppBarTitle()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              coinMetadata.baseAsset,
              style: AppFonts.semiBold.copyWith(
                color: AppColors.primaryTextColor,
                fontSize: 20.0,
              ),
              maxLines: 1,
            ),
            Text(
              ' | USD',
              style: AppFonts.semiBold.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 16.0,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildKlineChart() {
    return SizedBox(
      height: 344.0,
      child: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final klinePeriod = KlinePeriod.values[index];

          return CoinKlineChart(
            key: ValueKey(klinePeriod),
            klinePeriod: klinePeriod,
          );
        },
        itemCount: KlinePeriod.values.length,
      ),
    );
  }

  Widget _buildKlinePeriodSelector() {
    final selectedKlinePeriod = ref.read(selectedKlinePeriodNotifierProvider);

    return DefaultTabController(
      initialIndex: KlinePeriod.values.indexOf(selectedKlinePeriod),
      length: KlinePeriod.values.length,
      animationDuration: Duration.zero,
      child: TabBar(
        onTap: (index) {
          ref
              .read(selectedKlinePeriodNotifierProvider.notifier)
              .select(KlinePeriod.values[index]);

          _pageController.jumpToPage(index);
        },
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (_) => AppColors.splashColorDark,
        ),
        dividerColor: AppColors.dividerColorDark,
        labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        unselectedLabelColor: AppColors.secondaryTextColor,
        unselectedLabelStyle: AppFonts.medium.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 12.0,
        ),
        labelColor: AppColors.primaryColor,
        labelStyle: AppFonts.medium.copyWith(
          color: AppColors.primaryColor,
          fontSize: 12.0,
        ),
        indicator: const BoxDecoration(color: AppColors.transparent),
        indicatorAnimation: TabIndicatorAnimation.linear,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 1.0,
        tabs: <Widget>[
          for (final klinePeriod in KlinePeriod.values)
            SizedBox(
              height: 40.0,
              child: Center(child: Text(klinePeriod.name)),
            ),
        ],
      ),
    );
  }
}
