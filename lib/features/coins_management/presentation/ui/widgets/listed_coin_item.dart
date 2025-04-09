import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coin_view_model.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListedCoinItem extends ConsumerStatefulWidget {
  const ListedCoinItem({super.key, required this.listedCoin});

  final ListedCoin listedCoin;

  @override
  ConsumerState<ListedCoinItem> createState() => _ListedCoinItemState();
}

class _ListedCoinItemState extends ConsumerState<ListedCoinItem> {
  ListedCoin get _listedCoin => widget.listedCoin;

  @override
  Widget build(BuildContext context) {
    final symbol = _listedCoin.symbol;

    final coinMetadata = ref.watch(coinMetadataProvider(symbol));

    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        spacing: 12.0,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TokenIcon(symbol: symbol),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                coinMetadata.baseAsset,
                style: AppFonts.medium.copyWith(
                  color: AppColors.primaryTextColor,
                  fontSize: 16.0,
                  height: 1.5,
                ),
              ),
              Text(
                coinMetadata.name,
                style: AppFonts.medium.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14.0,
                  height: 1.5,
                ),
              ),
            ],
          ).expanded(),
          _buildSwitcher(),
        ],
      ),
    );
  }

  Widget _buildSwitcher() {
    final selected = ref.watch(
      listedCoinViewModelProvider(
        _listedCoin,
      ).select((state) => state.selected),
    );

    return Switch(
      value: selected,
      onChanged:
          ref.read(listedCoinViewModelProvider(_listedCoin).notifier).select,
      activeColor: AppColors.switchActiveColor,
      activeTrackColor: AppColors.switchActiveTrackColor,
      inactiveThumbColor: AppColors.switchInactiveThumbColor,
      inactiveTrackColor: AppColors.switchInactiveTrackColor,
      trackOutlineColor: const WidgetStatePropertyAll(
        AppColors.switchTrackOutlineColor,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
