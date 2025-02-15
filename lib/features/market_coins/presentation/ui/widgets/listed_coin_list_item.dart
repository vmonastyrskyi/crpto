import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/crypto_utils.dart';
import 'package:crpto/features/market_coins/domain/model/listed_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

class ListedCoinListItem extends ConsumerStatefulWidget {
  const ListedCoinListItem({
    super.key,
    required this.listedCoin,
  });

  final ListedCoin listedCoin;

  @override
  ConsumerState<ListedCoinListItem> createState() => _ListedCoinListItemState();
}

class _ListedCoinListItemState extends ConsumerState<ListedCoinListItem> {
  ListedCoin get _listedCoin => widget.listedCoin;

  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (_listedCoin.hasIcon)
            VectorGraphic(
              width: 40.0,
              height: 40.0,
              loader: AssetBytesLoader(
                CryptoUtils.getSvgVecPath(_listedCoin.baseAsset),
              ),
            ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _listedCoin.baseAsset,
                  style: AppFonts.regular.copyWith(
                    color: AppColors.primaryTextColor,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  CryptoUtils.getDisplayName(_listedCoin.baseAsset),
                  style: AppFonts.regular.copyWith(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),
          _buildSwitcher(),
        ],
      ),
    );
  }

  Widget _buildSwitcher() {
    return Switch(
      value: _isSwitched,
      onChanged: (switched) {
        setState(() => _isSwitched = switched);
      },
      activeColor: AppColors.switchActiveColor,
      activeTrackColor: AppColors.switchActiveTrackColor,
      inactiveThumbColor: AppColors.switchInactiveThumbColor,
      inactiveTrackColor: AppColors.switchInactiveTrackColor,
      trackOutlineColor: const WidgetStatePropertyAll(AppColors.switchTrackOutlineColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
