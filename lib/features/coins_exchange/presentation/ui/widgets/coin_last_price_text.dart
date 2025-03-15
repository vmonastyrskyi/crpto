import 'package:crpto/core/utils/app_colors.dart';
import 'package:crpto/core/utils/app_fonts.dart';
import 'package:crpto/core/utils/extensions/string.dart';
import 'package:flutter/material.dart';

class CoinLastPriceText extends StatefulWidget {
  const CoinLastPriceText({super.key, required this.lastPrice});

  final double lastPrice;

  @override
  State<CoinLastPriceText> createState() => _CoinLastPriceTextState();
}

class _CoinLastPriceTextState extends State<CoinLastPriceText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late Animation<Color?> _bodyColorAnimation;
  late Animation<Color?> _textColorAnimation;

  late double _oldLastPrice;

  @override
  void initState() {
    super.initState();

    _oldLastPrice = widget.lastPrice;

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _bodyColorAnimation = ColorTween(
      begin: AppColors.transparent,
      end: AppColors.transparent,
    ).animate(_animationController);
    _textColorAnimation = ColorTween(
      begin: AppColors.primaryTextColor,
      end: AppColors.primaryTextColor,
    ).animate(_animationController);
  }

  @override
  void didUpdateWidget(covariant CoinLastPriceText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.lastPrice != _oldLastPrice) {
      if (widget.lastPrice > _oldLastPrice) {
        _bodyColorAnimation = ColorTween(
          begin: AppColors.positivePriceColor.withValues(alpha: 0.25),
          end: AppColors.transparent,
        ).animate(_animationController);
        _textColorAnimation = ColorTween(
          begin: AppColors.positivePriceColor,
          end: AppColors.primaryTextColor,
        ).animate(_animationController);
      } else {
        _bodyColorAnimation = ColorTween(
          begin: AppColors.negativePriceColor.withValues(alpha: 0.25),
          end: AppColors.transparent,
        ).animate(_animationController);
        _textColorAnimation = ColorTween(
          begin: AppColors.negativePriceColor,
          end: AppColors.primaryTextColor,
        ).animate(_animationController);
      }

      _animationController.forward(from: 0.0);

      _oldLastPrice = widget.lastPrice;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lastPrice = StringX.formatCurrency(widget.lastPrice);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, _) {
        return Container(
          padding: const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: _bodyColorAnimation.value,
          ),
          child: Text(
            '\$$lastPrice',
            style: AppFonts.medium.copyWith(
              color: _textColorAnimation.value,
              fontSize: 16.0,
              height: 1.0,
            ),
          ),
        );
      },
    );
  }
}
