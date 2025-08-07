import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:crpto/features/coins_management/presentation/ui/widgets/listed_coin_list_view.dart';
import 'package:crpto/features/coins_management/presentation/view_model/listed_coins_view_model.dart';
import 'package:crpto/shared/presentation/ui/widgets/search_bar.dart';
import 'package:crpto/shared/presentation/ui/widgets/unfocus_tap_area.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinsManagementScreen extends ConsumerStatefulWidget {
  const CoinsManagementScreen({super.key});

  @override
  ConsumerState<CoinsManagementScreen> createState() =>
      _CoinsManagementScreenState();
}

class _CoinsManagementScreenState extends ConsumerState<CoinsManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.appColors.backgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: UnfocusTapArea(
          child: SafeArea(
            minimum: kIsWeb
                ? const EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 0.0)
                : EdgeInsets.zero,
            bottom: false,
            child: Scaffold(
              appBar: _buildAppBar(),
              body: Column(
                children: <Widget>[
                  _buildSearchBar(),
                  const ListedCoinListView().expanded(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(double.maxFinite),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(56.0),
        child: _buildAppBarTitle(),
      ).withPadding(kIsWeb ? 8.0 : 0.0, 0.0, kIsWeb ? 8.0 : 0.0, 0.0),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      spacing: 12.0,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BackButton(
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
          ),
          color: context.appColors.iconColor,
        ),
        Text(
          'Manage crypto',
          style: context.appFonts.semiBold.copyWith(
            color: context.appColors.primaryTextColor,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return CrptoSearchBar(
      hintText: 'Search',
      onChanged: ref
          .read(listedCoinsViewModelProvider.notifier)
          .searchListedCoins,
    ).withPaddingAll(12.0);
  }
}
