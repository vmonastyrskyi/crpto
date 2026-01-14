import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/ui/widgets/listed_coin_item.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coin_view_model.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_state.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_view_model.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/fade_switcher.dart';
import 'package:crpto/shared/presentation/ui/widgets/keep_alive.dart';
import 'package:crpto/shared/presentation/ui/widgets/shimmer_wrapper.dart';
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
    final listedCoinsState = ref.watch(listedCoinsViewModelProvider);

    Widget child = _buildNoListedCoinsFoundWarning();

    switch (listedCoinsState) {
      case AsyncLoading(value: final state):
        if (state == null || state.listedCoins.isEmpty) {
          child = const _ListedCoinListPlaceholder();
        } else if (state.listedCoins.isNotEmpty) {
          child = _buildListedCoins(state);
        }
      case AsyncError():
        throw UnimplementedError();
      case AsyncData(value: final state):
        if (state.listedCoins.isNotEmpty) {
          child = _buildListedCoins(state);
        }
    }

    return FadeSwitcher(child: child);
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

  Widget _buildNoListedCoinsFoundWarning() {
    return Center(
      child: Text(
        'No listed coins found.',
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

    final selectedListedCoins =
        [
          ...listedCoins.where((listedCoin) {
            final isSelected = ref
                .read(listedCoinViewModelProvider(listedCoin))
                .selected;

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

class _ListedCoinListPlaceholder extends StatelessWidget {
  const _ListedCoinListPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverList.builder(
            itemBuilder: (_, index) {
              return Row(
                spacing: 12.0,
                children: <Widget>[
                  _buildTokenIconPlaceholder(),
                  Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: <Widget>[
                      _buildCoinBaseAssetPlaceholder(),
                      _buildCoinNamePlaceholder(),
                    ],
                  ).expanded(),
                ],
              ).withPaddingAll(12.0);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTokenIconPlaceholder() {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: AppColors.primaryWidgetColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildCoinBaseAssetPlaceholder() {
    return SizedBox(
      height: 24.0,
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              height: 16.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.primaryWidgetColor,
              ),
            ),
          ).expanded(flex: 1),
          const Spacer(flex: 3),
        ],
      ),
    );
  }

  Widget _buildCoinNamePlaceholder() {
    return SizedBox(
      height: 21.0,
      child: Row(
        children: <Widget>[
          Center(
            child: Container(
              height: 14.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: AppColors.primaryWidgetColor,
              ),
            ),
          ).expanded(flex: 2),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
