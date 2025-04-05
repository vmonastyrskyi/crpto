import 'package:crpto/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          AppColors.shimmerBackgroundColor,
          AppColors.shimmerBackgroundColor,
          AppColors.shimmerOuterColor,
          AppColors.shimmerOuterColor,
          AppColors.shimmerInnerColor,
          AppColors.shimmerInnerColor,
          AppColors.shimmerOuterColor,
          AppColors.shimmerOuterColor,
          AppColors.shimmerBackgroundColor,
          AppColors.shimmerBackgroundColor,
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
      ),
      child: child,
    );
  }
}
