import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/list/coin_exchange_list_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/list/coin_exchange_list_state.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_exchange_item.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinExchangeList extends ConsumerStatefulWidget {
  const CoinExchangeList({super.key});

  @override
  ConsumerState<CoinExchangeList> createState() => _CoinExchangeListState();
}

class _CoinExchangeListState extends ConsumerState<CoinExchangeList> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(coinExchangeListControllerProvider);

    switch (asyncState) {
      case AsyncLoading(value: final state):
        if (state == null || state.coinsExchangeStats.isEmpty) {
          return _buildLoadingIndicator();
        }

        if (state.coinsExchangeStats.isNotEmpty) {
          return _buildCoinExchangeList(state);
        }
      case AsyncData(value: final state):
        if (state.coinsExchangeStats.isNotEmpty) {
          return _buildCoinExchangeList(state);
        }
    }

    return _buildNoCoinsSelectedWarning();
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(color: AppColors.loaderColor),
      ),
    );
  }

  Widget _buildCoinExchangeList(CoinExchangeListState state) {
    final coinsExchangeStats = state.coinsExchangeStats;

    coinsExchangeStats.sort((a, b) => b.quoteVolume.compareTo(a.quoteVolume));

    return CustomMaterialIndicator(
      displacement: 16.0,
      color: AppColors.bodyBackgroundColor,
      backgroundColor: AppColors.primaryTextColor,
      onRefresh:
          ref
              .read(coinExchangeListControllerProvider.notifier)
              .loadCoinsExchangeStats,
      child: ListView.builder(
        itemBuilder: (_, index) {
          final coinExchangeStats = coinsExchangeStats[index];

          return KeepAliveChild(
            child: CoinExchangeItem(
              key: ValueKey(coinExchangeStats.symbol),
              coinExchangeStats: coinExchangeStats,
            ),
          );
        },
        itemCount: coinsExchangeStats.length,
      ),
    );
  }

  Widget _buildNoCoinsSelectedWarning() {
    return Center(
      child: Text(
        'No coins selected yet',
        style: AppFonts.regular.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
