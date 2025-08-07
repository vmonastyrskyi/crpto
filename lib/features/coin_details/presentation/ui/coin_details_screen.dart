import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_kline_chart.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_price_performance_view.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/coin_ticker_stats_view.dart';
import 'package:crpto/features/coin_details/presentation/ui/widgets/flexible_app_bar.dart';
import 'package:crpto/shared/domain/model/enum/kline_period.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/foundation.dart';
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
  final ScrollController _scrollController = ScrollController();

  late final PageController _pageController;

  bool _isScrollAnimating = false;

  @override
  void initState() {
    super.initState();

    final selectedKlinePeriod = ref.read(selectedKlinePeriodNotifierProvider);

    _pageController = PageController(
      initialPage: KlinePeriod.values.indexOf(selectedKlinePeriod),
    );
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

    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider.value(value: Symbol(widget.symbol)),
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
                    body: SingleChildScrollView(
                      physics: kIsWeb
                          ? const BouncingScrollPhysics()
                          : const ClampingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 12.0),
                          _buildKlineChart(),
                          const SizedBox(height: 12.0),
                          _buildKlinePeriodSelector(),
                          const CoinTickerStatsView(),
                          const CoinPricePerformanceView(),
                          _buildCoinPriceDescription(),
                        ],
                      ),
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
    final selectedKlinePeriod = ref.read(selectedKlinePeriodNotifierProvider);

    return DefaultTabController(
      initialIndex: KlinePeriod.values.indexOf(selectedKlinePeriod),
      length: KlinePeriod.values.length,
      child: TabBar(
        onTap: (index) {
          ref
              .read(selectedKlinePeriodNotifierProvider.notifier)
              .select(KlinePeriod.values[index]);

          _pageController.jumpToPage(index);
        },
        overlayColor: WidgetStatePropertyAll(context.appColors.splashColorDark),
        dividerColor: context.appColors.dividerColor,
        dividerHeight: 1.0,
        labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
        unselectedLabelColor: context.appColors.secondaryTextColor,
        unselectedLabelStyle: context.appFonts.medium.copyWith(
          color: context.appColors.secondaryTextColor,
          fontSize: 12.0,
        ),
        labelColor: context.appColors.primaryColor,
        labelStyle: context.appFonts.medium.copyWith(
          color: context.appColors.primaryColor,
          fontSize: 12.0,
        ),
        indicatorColor: context.appColors.primaryColor,
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
          style: context.appFonts.regular.copyWith(
            color: context.appColors.secondaryTextColor,
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
