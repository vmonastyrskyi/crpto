import 'package:carousel_slider/carousel_slider.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trades_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentTradeListView extends ConsumerStatefulWidget {
  const RecentTradeListView({super.key});

  @override
  ConsumerState<RecentTradeListView> createState() =>
      _RecentTradeListViewState();
}

class _RecentTradeListViewState extends ConsumerState<RecentTradeListView> {
  @override
  Widget build(BuildContext context) {
    final recentTradesState = ref.watch(recentTradesNotifierProvider);

    Widget child = const SizedBox.shrink();

    switch (recentTradesState) {
      case AsyncLoading(value: final recentTradesMap):
        if (recentTradesMap == null || recentTradesMap.isEmpty) {
          child = const _RecentTradeListLoader();
        } else if (recentTradesMap.isNotEmpty) {
          final recentTrades = [...recentTradesMap.values];

          child = _buildRecentTradeList(recentTrades);
        }
      case AsyncData(value: final recentTradesMap):
        if (recentTradesMap.isNotEmpty) {
          final recentTrades = [...recentTradesMap.values];

          child = _buildRecentTradeList(recentTrades);
        }
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
      switchInCurve: Curves.fastOutSlowIn,
      switchOutCurve: Curves.fastOutSlowIn,
      transitionBuilder:
          (child, animation) =>
              FadeTransition(opacity: animation, child: child),
      child: child,
    );
  }

  Widget _buildRecentTradeList(List<RecentTrade> recentTrades) {
    final coinTickersMap = ref.read(coinTickersNotifierProvider).value;

    if (coinTickersMap != null && coinTickersMap.isNotEmpty) {
      final coinTickers = [...coinTickersMap.values];

      coinTickers.sort((a, b) => b.quoteVolume.compareTo(a.quoteVolume));

      final symbolIndexes = <String, int>{};

      for (final indexedCoinTicker in coinTickers.indexed) {
        final (index, coinTicker) = indexedCoinTicker;

        if (!symbolIndexes.containsKey(coinTicker.symbol)) {
          symbolIndexes[coinTicker.symbol] = index;
        }
      }

      recentTrades.sort((a, b) {
        final indexA = symbolIndexes[a.symbol] ?? -1;
        final indexB = symbolIndexes[b.symbol] ?? -1;

        return indexA.compareTo(indexB);
      });
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 160.0),
      child: CarouselSlider.builder(
        itemCount: recentTrades.length,
        options: CarouselOptions(
          enableInfiniteScroll: recentTrades.length > 1,
          viewportFraction: 0.667,
          disableCenter: true,
          autoPlay: false,
          padEnds: false,
          height: 160.0,
        ),
        itemBuilder: (_, index, _) {
          final recentTrade = recentTrades[index];

          return KeepAliveChild(
            child: RecentTradeItem(
              key: ValueKey(recentTrade.symbol),
              recentTrade: recentTrade,
            ).withPaddingAll(12.0),
          );
        },
      ),
    );
  }
}

class _RecentTradeListLoader extends StatefulWidget {
  const _RecentTradeListLoader();

  @override
  State<_RecentTradeListLoader> createState() => _RecentTradeListLoaderState();
}

class _RecentTradeListLoaderState extends State<_RecentTradeListLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        curve: Curves.fastOutSlowIn,
        parent: _animationController,
      ),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder:
          (_, child) => Opacity(opacity: _opacityAnimation.value, child: child),
      child: SizedBox(
        height: 160.0,
        child: LayoutBuilder(
          builder: (_, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return AspectRatio(
                  aspectRatio: maxWidth / maxHeight / 1.5,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColors.widgetBackgroundColorDark,
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
                            _buildCoinIconPlaceholder(),
                            _buildCoinSymbolPlaceholder(),
                          ],
                        ),
                        _buildTradePricePlaceholder(),
                        _buildTradeAmountPlaceholder(),
                      ],
                    ),
                  ).withPaddingAll(12.0),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildCoinIconPlaceholder() {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: AppColors.widgetBackgroundColorLight,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCoinSymbolPlaceholder() {
    return SizedBox(
      height: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.widgetBackgroundColorLight,
              ),
            ),
          ).expanded(flex: 1),
          const Spacer(flex: 3),
        ],
      ),
    ).expanded();
  }

  Widget _buildTradePricePlaceholder() {
    return SizedBox(
      height: 24.0,
      child: Row(
        spacing: 12.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.widgetBackgroundColorLight,
                  ),
                ),
              ).expanded(flex: 2),
              const Spacer(flex: 5),
              Center(
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.widgetBackgroundColorLight,
                  ),
                ),
              ).expanded(flex: 3),
            ],
          ).expanded(),
        ],
      ),
    );
  }

  Widget _buildTradeAmountPlaceholder() {
    return SizedBox(
      height: 24.0,
      child: Row(
        spacing: 12.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.widgetBackgroundColorLight,
                  ),
                ),
              ).expanded(flex: 3),
              const Spacer(flex: 5),
              Center(
                child: Container(
                  height: 16.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: AppColors.widgetBackgroundColorLight,
                  ),
                ),
              ).expanded(flex: 2),
            ],
          ).expanded(),
        ],
      ),
    );
  }
}
