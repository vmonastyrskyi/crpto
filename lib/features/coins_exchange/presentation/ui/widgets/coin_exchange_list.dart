import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_state.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_exchange_list_item.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinExchangeList extends ConsumerStatefulWidget {
  const CoinExchangeList({super.key});

  @override
  ConsumerState<CoinExchangeList> createState() => _CoinExchangeListState();
}

class _CoinExchangeListState extends ConsumerState<CoinExchangeList> {
  CoinsExchangeController get _coinsExchangeController =>
      ref.read(coinsExchangeControllerProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(coinsExchangeControllerProvider);

    return switch (state) {
      CoinsExchangeState(
        status: final status,
        coinsExchangeStats: final coinsExchangeStats,
      )
          when status == CoinsExchangeStatus.loading &&
              coinsExchangeStats.isEmpty =>
        _buildLoadingIndicator(),
      CoinsExchangeState(
        status: final status,
        coinsExchangeStats: final coinsExchangeStats,
      )
          when status == CoinsExchangeStatus.loaded ||
              coinsExchangeStats.isNotEmpty =>
        _buildCoinExchangeList(coinsExchangeStats),
      _ => _buildNoCoinsSelectedWarning(),
    };
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(color: AppColors.loaderColor),
      ),
    );
  }

  Widget _buildCoinExchangeList(List<CoinExchangeStats> coinsExchangeStats) {
    return CustomMaterialIndicator(
      displacement: 16.0,
      color: AppColors.bodyBackgroundColor,
      backgroundColor: AppColors.primaryTextColor,
      onRefresh: _coinsExchangeController.loadCoinsExchangeStats,
      child: ListView.builder(
        itemBuilder: (_, index) {
          final coinExchangeStats = coinsExchangeStats[index];

          return KeepAliveChild(
            child: CoinExchangeListItem(
              key: ObjectKey(coinExchangeStats),
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
