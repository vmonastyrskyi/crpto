import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/features/coins_management/domain/model/listed_coin.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coin_view_model.dart';
import 'package:crpto/shared/presentation/provider/coin_metadata.dart';
import 'package:crpto/shared/presentation/ui/widgets/token_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auto_size_text/flutter_auto_size_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListedCoinItem extends ConsumerStatefulWidget {
  const ListedCoinItem({super.key, required this.listedCoin});

  final ListedCoin listedCoin;

  @override
  ConsumerState<ListedCoinItem> createState() => _ListedCoinItemState();
}

class _ListedCoinItemState extends ConsumerState<ListedCoinItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12.0,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _buildTokenIcon(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              spacing: 6.0,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_buildCoinBaseAsset(), _buildCoinCategory()],
            ),
            _buildCoinName(),
          ],
        ).expanded(),
        _buildSwitcher(),
      ],
    ).withPaddingAll(12.0);
  }

  Widget _buildTokenIcon() {
    return TokenIcon(symbol: widget.listedCoin.symbol);
  }

  Widget _buildCoinBaseAsset() {
    return Consumer(
      builder: (_, ref, _) {
        final symbol = widget.listedCoin.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        return AutoSizeText(
          coinMetadata.baseAsset,
          style: AppFonts.medium.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 16.0,
          ),
          overflow: TextOverflow.ellipsis,
          minFontSize: 10.0,
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildCoinCategory() {
    return Consumer(
      builder: (_, ref, _) {
        final symbol = widget.listedCoin.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        final coinCategory = coinMetadata.category.name;

        return Container(
          margin: const EdgeInsets.only(bottom: 2.0),
          padding: const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.secondaryWidgetColor,
          ),
          child: Text(
            coinCategory.toUpperCase(),
            style: AppFonts.medium.copyWith(
              color: AppColors.secondaryTextColor,
              fontSize: 8.0,
              height: 1.0,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoinName() {
    return Consumer(
      builder: (_, ref, _) {
        final symbol = widget.listedCoin.symbol;

        final coinMetadata = ref.watch(coinMetadataProvider(symbol));

        return AutoSizeText(
          coinMetadata.name,
          style: AppFonts.medium.copyWith(
            color: AppColors.secondaryTextColor,
            fontSize: 14.0,
          ),
          overflow: TextOverflow.ellipsis,
          minFontSize: 8.0,
          maxLines: 1,
        );
      },
    );
  }

  Widget _buildSwitcher() {
    final selected = ref.watch(
      listedCoinViewModelProvider(
        widget.listedCoin,
      ).select((state) => state.selected),
    );

    return Switch(
      value: selected,
      onChanged:
          ref
              .read(listedCoinViewModelProvider(widget.listedCoin).notifier)
              .select,
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
