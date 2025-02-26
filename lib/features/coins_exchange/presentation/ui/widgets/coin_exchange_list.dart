import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/domain/model/coin_exchange_stats.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coins_exchange_state.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_exchange_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinExchangeList extends ConsumerWidget {
  const CoinExchangeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      _ => _buildNoListedCoinsFoundWarning(),
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

  Widget _buildCoinExchangeList(
    List<CoinExchangeStats> coinsExchangeStats,
  ) {
    return ListView.builder(
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
    );
  }

  Widget _buildNoListedCoinsFoundWarning() {
    return Center(
      child: Text(
        'No listed coins found',
        style: AppFonts.regular.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
