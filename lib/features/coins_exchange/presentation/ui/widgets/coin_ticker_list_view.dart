import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_item.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/keep_alive.dart';
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
          child = const _CoinTickerListPlaceholder();
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

    return FadeSwitcher(child: child);
  }

  Widget _buildCoinTickerList(List<CoinTicker> coinTickers) {
    coinTickers.sort((a, b) {
      final aCoinMetadata = ref.read(coinMetadataProvider(a.symbol));
      final bCoinMetadata = ref.read(coinMetadataProvider(b.symbol));

      return aCoinMetadata.rank.compareTo(bCoinMetadata.rank);
    });

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

class _CoinTickerListPlaceholder extends StatelessWidget {
  const _CoinTickerListPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }

  Widget _buildCoinIconPlaceholder() {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: AppColors.primaryWidgetColor,
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
                color: AppColors.primaryWidgetColor,
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
                color: AppColors.primaryWidgetColor,
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
                color: AppColors.primaryWidgetColor,
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
                color: AppColors.primaryWidgetColor,
              ),
            ),
          ).expanded(flex: 1),
        ],
      ),
    );
  }
}
