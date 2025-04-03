import 'package:crpto/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppFonts {
  static const TextStyle regular = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.5,
  );

  static const TextStyle medium = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 1.5,
  );

  static const TextStyle semiBold = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.5,
  );

  static const TextStyle bold = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    height: 1.5,
  );

  static const TextStyle extraBold = TextStyle(
    color: AppColors.primaryTextColor,
    fontWeight: FontWeight.w800,
    fontSize: 16.0,
    height: 1.5,
  );
}
