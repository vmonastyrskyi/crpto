import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_item.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinTickerListView extends ConsumerStatefulWidget {
  const CoinTickerListView({super.key});

  @override
  ConsumerState<CoinTickerListView> createState() => _CoinTickerListViewState();
}

class _CoinTickerListViewState extends ConsumerState<CoinTickerListView> {
  @override
  Widget build(BuildContext context) {
    final coinTickersState = ref.watch(coinTickersNotifierProvider);

    Widget child = _buildNoCoinsSelectedWarning();

    switch (coinTickersState) {
      case AsyncLoading(value: final coinTickersMap):
        if (coinTickersMap == null || coinTickersMap.isEmpty) {
          child = const _CoinTickerListLoader();
        } else if (coinTickersMap.isNotEmpty) {
          final coinTickers = [...coinTickersMap.values];

          child = _buildCoinTickerList(coinTickers);
        }
      case AsyncData(value: final coinTickersMap):
        if (coinTickersMap.isNotEmpty) {
          final coinTickers = [...coinTickersMap.values];

          child = _buildCoinTickerList(coinTickers);
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

  Widget _buildCoinTickerList(List<CoinTicker> coinTickers) {
    coinTickers.sort((a, b) => b.quoteVolume.compareTo(a.quoteVolume));

    return ListView.builder(
      itemBuilder: (_, index) {
        final coinTicker = coinTickers[index];

        return KeepAliveChild(
          child: CoinTickerItem(
            key: ValueKey(coinTicker.symbol),
            coinTicker: coinTicker,
          ),
        );
      },
      itemCount: coinTickers.length,
    );
  }

  Widget _buildNoCoinsSelectedWarning() {
    return Center(
      child: Text(
        'No coins selected yet',
        style: AppFonts.medium.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}

class _CoinTickerListLoader extends StatefulWidget {
  const _CoinTickerListLoader();

  @override
  State<_CoinTickerListLoader> createState() => _CoinTickerListLoaderState();
}

class _CoinTickerListLoaderState extends State<_CoinTickerListLoader>
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
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              spacing: 12.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildCoinIconPlaceholder(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildCoinBaseAssetPlaceholder(),
                    _buildCoinDisplayNamePlaceholder(),
                  ],
                ).expanded(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildCoinChangePricePlaceholder(),
                    _buildCoinChangePricePercentPlaceholder(),
                  ],
                ).expanded(),
              ],
            ),
          );
        },
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
        color: AppColors.widgetBackgroundColorDark,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCoinBaseAssetPlaceholder() {
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
                color: AppColors.widgetBackgroundColorDark,
              ),
            ),
          ).expanded(flex: 1),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildCoinDisplayNamePlaceholder() {
    return SizedBox(
      height: 21.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              height: 14.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: AppColors.widgetBackgroundColorDark,
              ),
            ),
          ).expanded(flex: 3),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildCoinChangePricePlaceholder() {
    return SizedBox(
      height: 24.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2),
          Center(
            child: Container(
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.widgetBackgroundColorDark,
              ),
            ),
          ).expanded(flex: 3),
        ],
      ),
    );
  }

  Widget _buildCoinChangePricePercentPlaceholder() {
    return SizedBox(
      height: 21.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2),
          Center(
            child: Container(
              height: 14.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: AppColors.widgetBackgroundColorDark,
              ),
            ),
          ).expanded(flex: 1),
        ],
      ),
    );
  }
}
