import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/ui/widgets/listed_coin_item.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coin_view_model.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_state.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_view_model.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/keep_alive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListedCoinListView extends ConsumerStatefulWidget {
  const ListedCoinListView({super.key});

  @override
  ConsumerState<ListedCoinListView> createState() => _ListedCoinListViewState();
}

class _ListedCoinListViewState extends ConsumerState<ListedCoinListView> {
  @override
  Widget build(BuildContext context) {
    final listedCoinsAsyncState = ref.watch(listedCoinsViewModelProvider);

    switch (listedCoinsAsyncState) {
      case AsyncError<ListedCoinsState>():
        throw UnimplementedError();
      case AsyncLoading(value: final state):
        if (state == null || state.listedCoins.isEmpty) {
          return _buildLoadingIndicator();
        }

        if (state.listedCoins.isNotEmpty) {
          return _buildListedCoins(state);
        }
      case AsyncData(value: final state):
        if (state.listedCoins.isNotEmpty) {
          return _buildListedCoins(state);
        }
    }

    return _buildNoListedCoinsFoundWarning();
  }

  Widget _buildListedCoins(ListedCoinsState state) {
    final listedCoins = _sortListedCoins(state.listedCoins);

    return ListView.builder(
      itemBuilder: (_, index) {
        final listedCoin = listedCoins[index];

        return KeepAliveChild(
          child: ListedCoinItem(
            key: ValueKey(listedCoin.symbol),
            listedCoin: listedCoin,
          ),
        );
      },
      itemCount: listedCoins.length,
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: CircularProgressIndicator(color: AppColors.loaderColor),
      ),
    );
  }

  Widget _buildNoListedCoinsFoundWarning() {
    return Center(
      child: Text(
        'No listed coins found',
        style: AppFonts.medium.copyWith(
          color: AppColors.secondaryTextColor,
          fontSize: 14.0,
        ),
      ),
    );
  }
}

extension _ListedCoinListStateX on _ListedCoinListViewState {
  List<ListedCoin> _sortListedCoins(List<ListedCoin> listedCoins) {
    final unselectedListedCoins = <ListedCoin>[];

    final selectedListedCoins = [
      ...listedCoins.where((listedCoin) {
        final isSelected =
            ref.read(listedCoinViewModelProvider(listedCoin)).selected;

        if (!isSelected) {
          unselectedListedCoins.add(listedCoin);
        }

        return isSelected;
      }),
    ]..sort((a, b) {
      final aCoinMetadata = ref.read(coinMetadataProvider(a.symbol));
      final bCoinMetadata = ref.read(coinMetadataProvider(b.symbol));

      return aCoinMetadata.rank.compareTo(bCoinMetadata.rank);
    });

    unselectedListedCoins.sort((a, b) {
      final aCoinMetadata = ref.read(coinMetadataProvider(a.symbol));
      final bCoinMetadata = ref.read(coinMetadataProvider(b.symbol));

      return aCoinMetadata.rank.compareTo(bCoinMetadata.rank);
    });

    return [...selectedListedCoins, ...unselectedListedCoins];
  }
}
