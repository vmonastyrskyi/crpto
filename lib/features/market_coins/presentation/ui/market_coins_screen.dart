import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/debounce.dart';
import 'package:crpto/core/utils/extensions/widget.dart';
import 'package:crpto/core/widgets/search_bar.dart';
import 'package:crpto/core/widgets/unfocus_tap_area.dart';
import 'package:crpto/features/market_coins/presentation/controller/listed_coins/listed_coins_controller.dart';
import 'package:crpto/features/market_coins/presentation/ui/widgets/listed_coin_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MarketCoinsScreen extends ConsumerStatefulWidget {
  const MarketCoinsScreen({super.key});

  @override
  ConsumerState<MarketCoinsScreen> createState() => _MarketCoinsScreenState();
}

class _MarketCoinsScreenState extends ConsumerState<MarketCoinsScreen> {
  final Debounce _searchListedCoinsDebounce = Debounce();

  ListedCoinsController get _listedCoinsController =>
      ref.listedCoinsController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listedCoinsController.loadListedCoins();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bodyBackgroundColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: UnfocusTapArea(
          child: SafeArea(
            bottom: false,
            child: Scaffold(
              appBar: _buildAppBar(),
              body: Column(
                children: <Widget>[
                  _buildSearchBar(),
                  const Expanded(child: ListedCoinList()),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Flexible(child: _buildAppBarTitle())],
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const BackButton(
          style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.all(8.0)),
          ),
          color: AppColors.iconColor,
        ).withPaddingAll(4.0),
        const SizedBox(width: 16.0),
        Text(
          'Manage crypto',
          style: AppFonts.semiBold.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return CRPTOSearchBar(
      hintText: 'Search',
      onChanged: (searchValue) {
        _searchListedCoinsDebounce(
          () => _listedCoinsController.searchListedCoins(searchValue.trim()),
          const Duration(milliseconds: 250),
        );
      },
    ).withPaddingAll(16.0);
  }
}
