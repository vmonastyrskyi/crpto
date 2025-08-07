import 'package:crpto/core/navigation/route_names.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/coins_exchange_screen.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_item.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_tickers_notifier.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/keep_alive.dart';
import 'package:crpto/shared/presentation/ui/widgets/shimmer_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: (_) {},
          child: Container(
            height: 36.0,
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 6.0, 12.0),
            color: context.appColors.backgroundColor,
            child: Row(
              spacing: 24.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Coin',
                  style: context.appFonts.medium.copyWith(
                    color: context.appColors.secondaryTextColor,
                    fontSize: 12.0,
                    height: 1.0,
                  ),
                ).expanded(flex: 54),
                Text(
                  '24h %',
                  style: context.appFonts.medium.copyWith(
                    color: context.appColors.secondaryTextColor,
                    fontSize: 12.0,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.end,
                ).expanded(flex: 16),
                Text(
                  'Price',
                  style: context.appFonts.medium.copyWith(
                    color: context.appColors.secondaryTextColor,
                    fontSize: 12.0,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.end,
                ).withPaddingOnly(right: 6.0).expanded(flex: 30),
              ],
            ),
          ),
        ),
        Consumer<HeaderBuilderNotifier>(
          builder: (_, headerBuilder, _) {
            final innerBoxIsScrolled = headerBuilder.innerBoxIsScrolled;

            if (!innerBoxIsScrolled) {
              return const SizedBox.shrink();
            }

            return Divider(
              color: context.appColors.dividerColor,
              thickness: 1.0,
              height: 1.0,
            );
          },
        ),
        CustomScrollView(
          physics: kIsWeb
              ? const BouncingScrollPhysics()
              : const ClampingScrollPhysics(),
          slivers: <Widget>[
            SliverList.builder(
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
            ),
            SliverToBoxAdapter(
              child: InkWell(
                onTap: () => context.pushNamed(RouteNames.coinsManagement),
                child: Center(
                  child: Text(
                    'Manage coins',
                    style: context.appFonts.semiBold.copyWith(
                      color: context.appColors.primaryColor,
                      fontSize: 14.0,
                    ),
                  ).withPaddingAll(12.0),
                ),
              ),
            ),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _buildNoCoinsSelectedWarning() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Column(
              spacing: 6.0,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'No coins selected yet.',
                  style: context.appFonts.medium.copyWith(
                    color: context.appColors.secondaryTextColor,
                    fontSize: 14.0,
                  ),
                ),
                InkWell(
                  onTap: () => context.pushNamed(RouteNames.coinsManagement),
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  child: Text(
                    'Manage coins',
                    style: context.appFonts.semiBold.copyWith(
                      color: context.appColors.primaryColor,
                      fontSize: 14.0,
                    ),
                  ).withPadding(16.0, 10.0, 16.0, 10.0),
                ),
              ],
            ),
          ).withPaddingAll(12.0),
        ),
      ],
    );
  }
}

class _CoinTickerListPlaceholder extends StatefulWidget {
  const _CoinTickerListPlaceholder();

  @override
  State<_CoinTickerListPlaceholder> createState() =>
      _CoinTickerListPlaceholderState();
}

class _CoinTickerListPlaceholderState
    extends State<_CoinTickerListPlaceholder> {
  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverList.builder(
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
        ],
      ),
    );
  }

  Widget _buildCoinIconPlaceholder() {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: context.appColors.primaryWidgetColor,
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
                color: context.appColors.primaryWidgetColor,
              ),
            ),
          ).expanded(),
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
                color: context.appColors.primaryWidgetColor,
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
                color: context.appColors.primaryWidgetColor,
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
                color: context.appColors.primaryWidgetColor,
              ),
            ),
          ).expanded(),
        ],
      ),
    );
  }
}
