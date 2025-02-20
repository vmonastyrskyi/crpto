import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/widgets/keep_alive.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coins/listed_coins_controller.dart';
import 'package:crpto/features/coins_management/presentation/controller/listed_coins/listed_coins_state.dart';
import 'package:crpto/features/coins_management/presentation/ui/widgets/listed_coin_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListedCoinList extends ConsumerWidget {
  const ListedCoinList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listedCoinsControllerProvider);

    return switch (state) {
      ListedCoinsState(status: final status, listedCoins: final listedCoins)
          when status == ListedCoinsStatus.loading && listedCoins.isEmpty =>
        _buildLoadingIndicator(),
      ListedCoinsState(status: final status, listedCoins: final listedCoins)
          when status == ListedCoinsStatus.loaded || listedCoins.isNotEmpty =>
        _buildListedCoinList(listedCoins),
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

  Widget _buildListedCoinList(List<ListedCoin> listedCoins) {
    return ListView.builder(
      itemBuilder: (_, index) {
        final listedCoin = listedCoins[index];

        return KeepAliveChild(
          child: ListedCoinListItem(
            key: ObjectKey(listedCoin),
            listedCoin: listedCoin,
          ),
        );
      },
      itemCount: listedCoins.length,
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
