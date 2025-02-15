import 'package:crpto/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppFonts {
  static const TextStyle regular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static const TextStyle medium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.textColor,
  );

  static const TextStyle semiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle bold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static const TextStyle extraBold = TextStyle(
    fontWeight: FontWeight.w800,
    color: AppColors.textColor,
  );
}
