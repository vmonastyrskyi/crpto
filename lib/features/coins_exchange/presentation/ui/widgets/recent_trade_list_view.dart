import 'package:carousel_slider/carousel_slider.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coins_exchange/domain/model/recent_trade.dart';
import 'package:crpto/features/coins_exchange/presentation/provider/recent_trades_notifier.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_item.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/keep_alive.dart';
import 'package:crpto/shared/presentation/ui/widgets/shimmer_wrapper.dart';
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
          child = const _RecentTradeListPlaceholder();
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

    return FadeSwitcher(child: child);
  }

  Widget _buildRecentTradeList(List<RecentTrade> recentTrades) {
    recentTrades.sort((a, b) {
      final aCoinMetadata = ref.read(coinMetadataProvider(a.symbol));
      final bCoinMetadata = ref.read(coinMetadataProvider(b.symbol));

      return aCoinMetadata.rank.compareTo(bCoinMetadata.rank);
    });

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

class _RecentTradeListPlaceholder extends StatelessWidget {
  const _RecentTradeListPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      begin: Alignment.topLeft,
      end: const Alignment(1.0, 3.0),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: context.appColors.primaryWidgetColor,
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
}
