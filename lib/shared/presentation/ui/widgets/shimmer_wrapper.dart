import 'package:crpto/core/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({
    super.key,
    this.begin = Alignment.topLeft,
    this.end = Alignment.centerRight,
    required this.child,
  });

  final Alignment begin;
  final Alignment end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: <Color>[
          context.appColors.shimmerBackgroundColor,
          context.appColors.shimmerBackgroundColor,
          context.appColors.shimmerOuterColor,
          context.appColors.shimmerOuterColor,
          context.appColors.shimmerInnerColor,
          context.appColors.shimmerInnerColor,
          context.appColors.shimmerOuterColor,
          context.appColors.shimmerOuterColor,
          context.appColors.shimmerBackgroundColor,
          context.appColors.shimmerBackgroundColor,
        ],
        stops: <double>[
          0.0,
          0.482,
          0.482,
          0.494,
          0.494,
          0.506,
          0.506,
          0.518,
          0.518,
          1.0,
        ],
        begin: begin,
        end: end,
      ),
      child: child,
    );
  }
}
