import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_kline_chart.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_order_book.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_price_performance_view.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_ticker_stats_view.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/flexible_app_bar.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:provider/provider.dart' hide Consumer;
import 'package:provider/single_child_widget.dart';

class CoinDetailsScreen extends ConsumerStatefulWidget {
  const CoinDetailsScreen({super.key, required this.symbol});

  final String symbol;

  @override
  ConsumerState<CoinDetailsScreen> createState() => _CoinDetailsScreenState();
}

class _CoinDetailsScreenState extends ConsumerState<CoinDetailsScreen> {
  final ScrollController _scrollController = .new();

  late final PageController _pageController;

  bool _isScrollAnimating = false;

  @override
  void initState() {
    super.initState();

    final selectedKlinePeriod = ref.read(selectedKlinePeriodProvider);

    _pageController = PageController(
      initialPage: KlinePeriod.values.indexOf(selectedKlinePeriod),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(selectedCoinKlineProvider, (
      prevSelectedCoinKline,
      nextSelectedCoinKline,
    ) {
      if (prevSelectedCoinKline == nextSelectedCoinKline) return;

      HapticFeedback.lightImpact();
    });

    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider.value(value: Symbol(widget.symbol)),
      ],
      child: Container(
        color: AppColors.backgroundColor,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: UnfocusTapArea(
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                body: NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (_, _) {
                      return <Widget>[
                        FlexibleAppBar(
                          scrollController: _scrollController,
                          onAppBarPressed: _onAppBarPressed,
                        ),
                      ];
                    },
                    body: CustomScrollView(
                      slivers: <Widget>[
                        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
                        SliverToBoxAdapter(child: _buildKlineChart()),
                        const SliverToBoxAdapter(child: SizedBox(height: 12.0)),
                        SliverToBoxAdapter(child: _buildKlinePeriodSelector()),
                        const SliverToBoxAdapter(child: CoinTickerStatsView()),
                        const SliverToBoxAdapter(
                          child: CoinPricePerformanceView(),
                        ),
                        const CoinOrderBook(),
                        SliverToBoxAdapter(child: _buildCoinPriceDescription()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
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
    final selectedKlinePeriod = ref.read(selectedKlinePeriodProvider);

    return DefaultTabController(
      initialIndex: KlinePeriod.values.indexOf(selectedKlinePeriod),
      length: KlinePeriod.values.length,
      child: TabBar(
        onTap: (index) {
          ref
              .read(selectedKlinePeriodProvider.notifier)
              .select(KlinePeriod.values[index]);

          _pageController.jumpToPage(index);
        },
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (_) => AppColors.splashColorDark,
        ),
        dividerColor: AppColors.dividerColor,
        dividerHeight: 1.0,
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
        indicatorColor: AppColors.primaryColor,
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

  Widget _buildCoinPriceDescription() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        final coinDescription = coinMetadata.description;

        return Text(
          coinDescription,
          style: AppFonts.regular.copyWith(
            color: AppColors.secondaryTextColor,
            fontSize: 14.0,
          ),
        ).withPaddingAll(12.0);
      },
    );
  }
}

extension _CoinDetailsScreenStateX on _CoinDetailsScreenState {
  bool _onScrollNotification(ScrollNotification notification) {
    if (_isScrollAnimating) return true;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!_isScrollAnimating && notification is ScrollEndNotification) {
        final scrollOffset = _scrollController.hasClients
            ? _scrollController.offset
            : 0.0;

        if (scrollOffset > expandedHeight - toolbarHeight) return;

        final scrollValue = Curves.easeOutSine.transform(
          (scrollOffset / (expandedHeight - toolbarHeight)).clamp(0.0, 1.0),
        );

        final scrollPosition = scrollValue > 0.5
            ? expandedHeight - toolbarHeight
            : 0.0;

        _isScrollAnimating = true;

        await _scrollController.animateTo(
          scrollPosition,
          duration: const Duration(milliseconds: 125),
          curve: Curves.easeOutSine,
        );

        _isScrollAnimating = false;
      }
    });

    return false;
  }

  void _onAppBarPressed() async {
    final scrollOffset = _scrollController.hasClients
        ? _scrollController.offset
        : 0.0;

    if (_isScrollAnimating ||
        (scrollOffset < (expandedHeight - toolbarHeight))) {
      return;
    }

    _isScrollAnimating = true;

    await _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 125),
      curve: Curves.easeOutSine,
    );

    _isScrollAnimating = false;
  }
}
