import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coin_details/presentation/provider/coin_klines_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_coin_kline_notifier.dart';
import 'package:crpto/features/coin_details/presentation/provider/selected_kline_period_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_last_price_text.dart';
import 'package:crpto/shared/domain/model/coin_kline.dart';
import 'package:crpto/shared/domain/model/coin_ticker.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/coin_ticker_notifier.dart';
import 'package:crpto/shared/presentation/provider/model/scroll_value.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider;
import 'package:provider/provider.dart' hide Consumer;
import 'package:provider/single_child_widget.dart';

const double expandedHeight = toolbarHeight + 72.0;
const double toolbarHeight = 56.0;

class FlexibleAppBar extends StatefulWidget {
  const FlexibleAppBar({
    super.key,
    required this.scrollController,
    required this.onAppBarPressed,
  });

  final ScrollController scrollController;
  final VoidCallback onAppBarPressed;

  @override
  State<FlexibleAppBar> createState() => _FlexibleAppBarState();
}

class _FlexibleAppBarState extends State<FlexibleAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        title: GestureDetector(
          onTap: widget.onAppBarPressed,
          child: DecoratedBox(
            decoration: BoxDecoration(color: context.appColors.backgroundColor),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                _buildBackButton(),
                _buildAppBarTitle(),
                _buildHeaderContent(),
                _buildDivider(),
              ],
            ),
          ),
        ),
        collapseMode: CollapseMode.pin,
        titlePadding: EdgeInsets.zero,
        expandedTitleScale: 1.0,
      ),
      forceMaterialTransparency: true,
      expandedHeight: expandedHeight,
      toolbarHeight: toolbarHeight,
      pinned: true,
    );
  }

  Widget _buildBackButton() {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (_, child) {
        return Positioned(
          height: toolbarHeight,
          left: 8.0,
          top: 0.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: BackButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
              ),
              color: context.appColors.iconColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (_, child) {
        final scrollValue = _calculateScrollValue();

        final opacity = (1.0 - 2.0 * scrollValue).clamp(0.0, 1.0);

        return Positioned(
          height: toolbarHeight,
          left: 0.0,
          top: 0.0,
          right: 0.0,
          child: Opacity(
            opacity: opacity,
            child: FadeSwitcher(
              duration: const Duration(milliseconds: 125),
              reverseDuration: const Duration(milliseconds: 125),
              child: scrollValue > 0.5 ? const SizedBox.shrink() : child!,
            ),
          ),
        );
      },
      child: _buildTitleText(),
    );
  }

  Widget _buildTitleText() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        return Text(
          coinMetadata.baseAsset,
          style: context.appFonts.semiBold.copyWith(
            color: context.appColors.primaryTextColor,
            fontSize: 18.0,
          ),
        );
      },
    );
  }

  Widget _buildHeaderContent() {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (_, child) {
        final scrollValue = _calculateScrollValue();

        return MultiProvider(
          providers: <SingleChildWidget>[
            ProxyProvider0(update: (_, _) => ScrollValue(scrollValue)),
          ],
          child: Positioned(
            left: 52.0 * scrollValue + 12.0,
            top:
                (1.0 - scrollValue) * (toolbarHeight + 12.0) +
                (6.5 * scrollValue),
            right: 6.0,
            bottom: 12.0 - (5.5 * scrollValue),
            child: child!,
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            spacing: 12.0,
            children: <Widget>[
              _buildCoinIcon(),
              _buildCoinTitle().expanded(),
              _buildCoinPrice().expanded(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCoinIcon() {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final symbol = context.symbol;
        final scrollValue = context.scrollValue;

        final size = 24.0 + 16.0 * (1.0 - scrollValue);

        return TokenIcon(symbol: symbol, size: size);
      },
    );
  }

  Widget _buildCoinTitle() {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final scrollValue = context.scrollValue;

        return FadeSwitcher(
          duration: const Duration(milliseconds: 125),
          reverseDuration: const Duration(milliseconds: 125),
          layoutBuilder: (currentChild, previousChildren) => Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          ),
          child: scrollValue > 0.5
              ? _buildCoinBaseAsset(scrollValue)
              : _buildCoinName(scrollValue),
        );
      },
    );
  }

  Widget _buildCoinBaseAsset(double scrollValue) {
    return Consumer(
      key: const ValueKey('coin-base-asset'),
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        final fontSize = (16.0 - (scrollValue * 2.0)).clamp(14.0, 15.0);

        return Text(
          coinMetadata.baseAsset,
          style: context.appFonts.semiBold.copyWith(
            color: context.appColors.primaryTextColor,
            fontSize: fontSize,
          ),
        );
      },
    );
  }

  Widget _buildCoinName(double scrollValue) {
    return Consumer(
      key: const ValueKey('coin-name'),
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        final fontSize = (16.0 - (scrollValue * 2.0)).clamp(15.0, 16.0);

        return Text(
          coinMetadata.name,
          style: context.appFonts.medium.copyWith(
            color: context.appColors.primaryTextColor,
            fontSize: fontSize,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildCoinPrice() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        final selectedCoinKline = ref.watch(selectedCoinKlineNotifierProvider);
        final selectedKlinePeriod = ref.read(
          selectedKlinePeriodNotifierProvider,
        );

        final coinKlinesMap = ref
            .read(coinKlinesNotifierProvider(symbol))
            .value;

        final coinKlines = coinKlinesMap?[selectedKlinePeriod] ?? [];

        if (coinKlines.isNotEmpty && selectedCoinKline != null) {
          return _buildSelectedCoinKlinePriceValues(
            selectedCoinKline,
            coinKlines,
          );
        }

        return _buildCoinPriceValues();
      },
    );
  }

  Widget _buildSelectedCoinKlinePriceValues(
    CoinKline selectedCoinKline,
    List<CoinKline> coinKlines,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildSelectedCoinKlineLastPrice(selectedCoinKline),
        AnimatedBuilder(
          animation: widget.scrollController,
          builder: (context, _) {
            final scrollValue = context.scrollValue;

            final spacing = (1.0 - scrollValue) * 3.0;

            return SizedBox(height: spacing);
          },
        ),
        _buildSelectedCoinKlinePriceChange(selectedCoinKline, coinKlines),
      ],
    ).withPaddingOnly(right: 6.0);
  }

  Widget _buildSelectedCoinKlineLastPrice(CoinKline selectedCoinKline) {
    final lastPrice = StringX.formatCurrency(selectedCoinKline.closePrice);

    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final scrollValue = context.scrollValue;

        final fontSize = 16.0 - (scrollValue * 2.0);

        return Text(
          '\$$lastPrice',
          style: context.appFonts.medium.copyWith(
            color: context.appColors.primaryTextColor,
            fontSize: fontSize,
          ),
        );
      },
    );
  }

  Widget _buildSelectedCoinKlinePriceChange(
    CoinKline selectedCoinKline,
    List<CoinKline> coinKlines,
  ) {
    final initialCoinKline = coinKlines.first;

    final priceChange = StringX.formatCurrency(
      (selectedCoinKline.closePrice - initialCoinKline.closePrice).abs(),
    );
    final priceChangePercent =
        (((selectedCoinKline.closePrice - initialCoinKline.closePrice) /
                    initialCoinKline.closePrice) *
                100.0)
            .abs()
            .toStringAsFixed(2);
    final isPriceNegative =
        (selectedCoinKline.closePrice - initialCoinKline.closePrice).isNegative;

    final priceSign = isPriceNegative ? '-' : '+';

    final priceChangeBuffer = StringBuffer()
      ..writeAll([
        '$priceSign$priceChange\$',
        '($priceSign$priceChangePercent%)',
      ], ' ');

    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final scrollValue = context.scrollValue;

        final fontSize = 14.0 - (scrollValue * 2.0);

        return SizedBox(
          height: 21.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              '$priceChangeBuffer',
              style: context.appFonts.medium.copyWith(
                color: isPriceNegative
                    ? context.appColors.negativePriceColor
                    : context.appColors.positivePriceColor,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.right,
              minFontSize: 10.0,
              maxLines: 1,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoinPriceValues() {
    return Consumer(
      builder: (context, ref, _) {
        final symbol = context.symbol;

        ref.watch(
          coinTickerNotifierProvider(
            symbol,
          ).select((coinTicker) => coinTicker?.lastPrice),
        );

        final coinTicker = ref.read(coinTickerNotifierProvider(symbol));

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            if (coinTicker != null) _buildCoinLastPrice(coinTicker),
            AnimatedBuilder(
              animation: widget.scrollController,
              builder: (context, _) {
                final scrollValue = context.scrollValue;

                final spacing = (1.0 - scrollValue) * 3.0;

                return SizedBox(height: spacing);
              },
            ),
            if (coinTicker != null) _buildCoinPriceChange(coinTicker),
          ],
        );
      },
    );
  }

  Widget _buildCoinLastPrice(CoinTicker coinTicker) {
    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final scrollValue = context.scrollValue;

        final fontSize = 16.0 - (scrollValue * 2.0);

        return CoinLastPriceText(
          lastPrice: coinTicker.lastPrice,
          fontSize: fontSize,
        );
      },
    );
  }

  Widget _buildCoinPriceChange(CoinTicker coinTicker) {
    final priceChange = StringX.formatCurrency(coinTicker.priceChange.abs());
    final priceChangePercent = coinTicker.priceChangePercent
        .abs()
        .toStringAsFixed(2);
    final isPriceNegative = coinTicker.priceChange.isNegative;

    final priceSign = isPriceNegative ? '-' : '+';

    final priceChangeBuffer = StringBuffer()
      ..writeAll([
        '$priceSign$priceChange\$',
        '($priceSign$priceChangePercent%)',
      ], ' ');

    return AnimatedBuilder(
      animation: widget.scrollController,
      builder: (context, _) {
        final scrollValue = context.scrollValue;

        final fontSize = 14.0 - (scrollValue * 2.0);

        return SizedBox(
          height: 21.0,
          child: Align(
            alignment: Alignment.centerRight,
            child: AutoSizeText(
              '$priceChangeBuffer',
              style: context.appFonts.medium.copyWith(
                color: isPriceNegative
                    ? context.appColors.negativePriceColor
                    : context.appColors.positivePriceColor,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.right,
              minFontSize: 10.0,
              maxLines: 1,
            ),
          ),
        ).withPaddingOnly(right: 6.0);
      },
    );
  }

  Widget _buildDivider() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Divider(
        color: context.appColors.dividerColor,
        thickness: 1.0,
        height: 1.0,
      ),
    );
  }
}

extension _FlexibleAppBarX on _FlexibleAppBarState {
  double _calculateScrollValue() {
    final scrollOffset = widget.scrollController.hasClients
        ? widget.scrollController.offset
        : 0.0;

    final scrollValue = Curves.easeOutSine.transform(
      (scrollOffset / (expandedHeight - toolbarHeight)).clamp(0.0, 1.0),
    );

    return scrollValue;
  }
}
