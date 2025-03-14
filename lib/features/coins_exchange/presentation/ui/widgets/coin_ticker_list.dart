import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_list/coin_ticker_list_controller.dart';
import 'package:crpto/features/coins_exchange/presentation/controller/coin_ticker_list/coin_ticker_list_state.dart';
import 'package:crpto/features/coins_exchange/presentation/ui/widgets/coin_ticker_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinTickerList extends ConsumerStatefulWidget {
  const CoinTickerList({super.key});

  @override
  ConsumerState<CoinTickerList> createState() => _CoinTickerListState();
}

class _CoinTickerListState extends ConsumerState<CoinTickerList> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(coinTickerListControllerProvider);

    switch (asyncState) {
      case AsyncLoading(value: final state):
        if (state == null || state.tickers.isEmpty) {
          return _buildLoadingIndicator();
        }

        if (state.tickers.isNotEmpty) {
          return _buildCoinTickerList(state);
        }
      case AsyncData(value: final state):
        if (state.tickers.isNotEmpty) {
          return _buildCoinTickerList(state);
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

  Widget _buildCoinTickerList(CoinTickerListState state) {
    final coinTickers = [...state.tickers.values];

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
        style: AppFonts.regular.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
