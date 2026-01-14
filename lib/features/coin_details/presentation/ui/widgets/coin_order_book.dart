import 'dart:math' as math;

import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coin_details/domain/model/order_book_level_depth.dart';
import 'package:crpto/features/coin_details/presentation/provider/order_book_notifier.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/provider/model/symbol.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/shimmer_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';

class CoinOrderBook extends ConsumerStatefulWidget {
  const CoinOrderBook({super.key});

  @override
  ConsumerState createState() => _CoinOrderBookState();
}

class _CoinOrderBookState extends ConsumerState<CoinOrderBook> {
  @override
  Widget build(BuildContext context) {
    final orderBookState = ref.watch(orderBookProvider(context.symbol));

    Widget child = SliverToBoxAdapter(
      child: Center(
        child: Text(
          'No data available',
          style: AppFonts.medium.copyWith(
            color: AppColors.secondaryTextColor,
            fontSize: 14.0,
          ),
        ),
      ),
    );

    switch (orderBookState) {
      case AsyncLoading():
        child = const SliverToBoxAdapter(child: _OrderBookPlaceholder());
      case AsyncError():
        child = SliverToBoxAdapter(
          child: Center(
            child: Text(
              'Something went wrong!',
              style: AppFonts.medium.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: 14.0,
              ),
            ),
          ),
        );
      case AsyncData(value: final aggregatedOrderBook):
        final bids = aggregatedOrderBook.bids;
        final asks = aggregatedOrderBook.asks;

        final bidMax = bids.isEmpty ? 1.0 : bids.last.depth;
        final askMax = asks.isEmpty ? 1.0 : asks.last.depth;

        final rowCount = math.max(bids.length, asks.length);

        child = MultiSliver(
          children: <Widget>[
            SliverToBoxAdapter(child: _buildHeader()),
            const SliverToBoxAdapter(child: SizedBox(height: 4.0)),
            SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((_, index) {
                final bid = index < bids.length ? bids[index] : null;
                final ask = index < asks.length ? asks[index] : null;

                return Row(
                  children: <Widget>[
                    Expanded(
                      child: bid != null
                          ? _CoinOrderBookRow(
                              orderBookLevelDepth: bid,
                              maxDepth: bidMax,
                              isBid: true,
                            )
                          : const SizedBox(),
                    ),
                    Expanded(
                      child: ask != null
                          ? _CoinOrderBookRow(
                              orderBookLevelDepth: ask,
                              maxDepth: askMax,
                              isBid: false,
                            )
                          : const SizedBox(),
                    ),
                  ],
                );
              }, childCount: rowCount - 1),
              itemExtent: 20.0,
            ),
          ],
        );
    }

    return MultiSliver(
      children: <Widget>[
        MultiSliver(
          children: <Widget>[
            SliverToBoxAdapter(child: _buildTitle()),
            const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            FadeSwitcher(useSliver: true, child: child),
          ],
        ).withSliverPaddingAll(12.0),
        const SliverToBoxAdapter(
          child: Divider(
            color: AppColors.dividerColor,
            thickness: 1.0,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      'Order book',
      style: AppFonts.semiBold.copyWith(
        color: AppColors.primaryTextColor,
        fontSize: 14.0,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      spacing: 12.0,
      children: <Widget>[
        Expanded(
          child: Text(
            'Bid',
            style: AppFonts.semiBold.copyWith(
              color: AppColors.secondaryTextColor,
              fontSize: 12.0,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Ask',
            style: AppFonts.semiBold.copyWith(
              color: AppColors.secondaryTextColor,
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}

class _CoinOrderBookRow extends ConsumerStatefulWidget {
  const _CoinOrderBookRow({
    required this.orderBookLevelDepth,
    required this.maxDepth,
    required this.isBid,
  });

  final OrderBookLevelDepth orderBookLevelDepth;
  final double maxDepth;
  final bool isBid;

  @override
  ConsumerState<_CoinOrderBookRow> createState() => _CoinOrderBookRowState();
}

class _CoinOrderBookRowState extends ConsumerState<_CoinOrderBookRow> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final ratio = widget.orderBookLevelDepth.depth / widget.maxDepth;
        final barWidth = constraints.maxWidth * ratio;

        return Stack(
          alignment: .center,
          children: <Widget>[
            Align(
              alignment: widget.isBid ? .centerRight : .centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.fastOutSlowIn,
                width: barWidth,
                color:
                    (widget.isBid
                            ? AppColors.positivePriceColor
                            : AppColors.negativePriceColor)
                        .withValues(alpha: 0.125),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: widget.isBid
                  ? <Widget>[
                      _buildQuantity(widget.orderBookLevelDepth.level.quantity),
                      _buildPrice(
                        widget.orderBookLevelDepth.level.price,
                        AppColors.positivePriceColor,
                      ),
                    ]
                  : <Widget>[
                      _buildPrice(
                        widget.orderBookLevelDepth.level.price,
                        AppColors.negativePriceColor,
                      ),
                      _buildQuantity(widget.orderBookLevelDepth.level.quantity),
                    ],
            ).withPaddingOnly(
              left: widget.isBid ? 0.0 : 6.0,
              right: widget.isBid ? 6.0 : 0.0,
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuantity(double quantity) {
    final coinMetadata = ref.watch(coinMetadataProvider(context.symbol));

    return Text(
      _formatNumber(quantity, coinMetadata.stepSize),
      style: AppFonts.medium.copyWith(
        color: AppColors.primaryTextColor,
        fontSize: 12.0,
      ),
    );
  }

  Widget _buildPrice(double price, Color color) {
    return Text(
      StringX.formatCurrency(price),
      style: AppFonts.medium.copyWith(color: color, fontSize: 12.0),
    );
  }

  int _precisionFromStep(String step) {
    if (!step.contains('.')) return 0;

    final decimalPart = step.split('.')[1];
    final firstOneIndex = decimalPart.indexOf('1');

    if (firstOneIndex == -1) return 0;

    return firstOneIndex + 1;
  }

  String _formatNumber(double value, String stepOrTick) {
    final precision = _precisionFromStep(stepOrTick);

    return value.toStringAsFixed(precision);
  }
}

class _OrderBookPlaceholder extends StatelessWidget {
  const _OrderBookPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Column(
        spacing: 4.0,
        children: <Widget>[
          for (int i = 0; i < 8; i++)
            SizedBox(
              height: 20.0,
              child: Row(
                spacing: 12.0,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      _buildBidQuantityPlaceholder().expanded(flex: 4),
                      const Spacer(flex: 3),
                      _buildBidPricePlaceholder().expanded(flex: 3),
                    ],
                  ).expanded(),
                  Row(
                    children: <Widget>[
                      _buildBidQuantityPlaceholder().expanded(flex: 3),
                      const Spacer(flex: 3),
                      _buildBidPricePlaceholder().expanded(flex: 4),
                    ],
                  ).expanded(),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBidQuantityPlaceholder() {
    return SizedBox(
      height: 12.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primaryWidgetColor,
        ),
      ),
    );
  }

  Widget _buildBidPricePlaceholder() {
    return SizedBox(
      height: 12.0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.primaryWidgetColor,
        ),
      ),
    );
  }
}
