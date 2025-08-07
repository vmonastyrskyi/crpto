import 'package:crpto/core/utils/extensions/string.dart';
import 'package:crpto/core/utils/theme/themes.dart';
import 'package:flutter/material.dart';

class CoinLastPriceText extends StatefulWidget {
  const CoinLastPriceText({
    super.key,
    required this.lastPrice,
    this.fontSize = 16.0,
  });

  final double lastPrice;
  final double fontSize;

  @override
  State<CoinLastPriceText> createState() => _CoinLastPriceTextState();
}

class _CoinLastPriceTextState extends State<CoinLastPriceText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _fastOutSlowInAnimation;

  late Animation<Color?> _bodyColorAnimation;
  late Animation<Color?> _textColorAnimation;

  late double _previousLastPrice;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fastOutSlowInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );

    _previousLastPrice = widget.lastPrice;
  }

  @override
  void didChangeDependencies() {
    _bodyColorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.transparent,
    ).animate(_fastOutSlowInAnimation);
    _textColorAnimation = ColorTween(
      begin: context.appColors.primaryTextColor,
      end: context.appColors.primaryTextColor,
    ).animate(_fastOutSlowInAnimation);

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CoinLastPriceText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.lastPrice != _previousLastPrice) {
      if (widget.lastPrice > _previousLastPrice) {
        _bodyColorAnimation = ColorTween(
          begin: context.appColors.positivePriceColor.withValues(alpha: 0.25),
          end: Colors.transparent,
        ).animate(_fastOutSlowInAnimation);
        _textColorAnimation = ColorTween(
          begin: context.appColors.positivePriceColor,
          end: context.appColors.primaryTextColor,
        ).animate(_fastOutSlowInAnimation);
      } else {
        _bodyColorAnimation = ColorTween(
          begin: context.appColors.negativePriceColor.withValues(alpha: 0.25),
          end: Colors.transparent,
        ).animate(_fastOutSlowInAnimation);
        _textColorAnimation = ColorTween(
          begin: context.appColors.negativePriceColor,
          end: context.appColors.primaryTextColor,
        ).animate(_fastOutSlowInAnimation);
      }

      _animationController.forward(from: 0.0);

      _previousLastPrice = widget.lastPrice;
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
            style: context.appFonts.medium.copyWith(
              color: _textColorAnimation.value,
              fontSize: widget.fontSize,
              height: 1.0,
            ),
          ),
        );
      },
    );
  }
}
