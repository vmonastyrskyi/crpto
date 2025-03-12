import 'package:carousel_slider/carousel_slider.dart';
import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/recent_trade_list/recent_trade_list_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/recent_trade_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentTradeList extends ConsumerStatefulWidget {
  const RecentTradeList({super.key});

  @override
  ConsumerState<RecentTradeList> createState() => _RecentTradeListState();
}

class _RecentTradeListState extends ConsumerState<RecentTradeList> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(recentTradeListControllerProvider);

    switch (asyncState) {
      case AsyncLoading(value: final state):
        if (state == null || state.recentTrades.isEmpty) {
          return _buildLoadingIndicator();
        }

      case AsyncData(value: final state):
        final recentTrades = state.recentTrades;

        if (recentTrades.isEmpty) {
          return const SizedBox.shrink();
        }

        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 184.0),
          child: LayoutBuilder(
            builder: (context, cons) {
              return CarouselSlider.builder(
                itemCount: recentTrades.length,
                options: CarouselOptions(
                  height: 184.0,
                  enableInfiniteScroll: recentTrades.length > 1,
                  viewportFraction: 0.667,
                  disableCenter: true,
                  autoPlay: false,
                  padEnds: false,
                ),
                itemBuilder: (_, index, _) {
                  final recentTrade = [...recentTrades.values][index];

                  return KeepAliveChild(
                    child: RecentTradeItem(
                      key: ValueKey(recentTrade.symbol),
                      recentTrade: recentTrade,
                    ).withPaddingAll(16.0),
                  );
                },
              );
            },
          ),
        );
    }

    return const SizedBox.shrink();
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(color: AppColors.loaderColor),
      ),
    );
  }
}
