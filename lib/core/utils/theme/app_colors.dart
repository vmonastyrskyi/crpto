import 'package:flutter/material.dart';

extension AppColorsX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.primaryWidgetColor,
    required this.secondaryWidgetColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.hintTextColor,
    required this.iconColor,
    required this.shadowColor,
    required this.switchActiveColor,
    required this.switchActiveTrackColor,
    required this.switchInactiveTrackColor,
    required this.switchInactiveThumbColor,
    required this.switchTrackOutlineColor,
    required this.dividerColor,
    required this.splashColorDark,
    required this.splashColorLight,
    required this.loaderColor,
    required this.shimmerBackgroundColor,
    required this.shimmerOuterColor,
    required this.shimmerInnerColor,
    required this.positivePriceColor,
    required this.negativePriceColor,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color primaryWidgetColor;
  final Color secondaryWidgetColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color hintTextColor;
  final Color iconColor;
  final Color shadowColor;
  final Color switchActiveColor;
  final Color switchActiveTrackColor;
  final Color switchInactiveTrackColor;
  final Color switchInactiveThumbColor;
  final Color switchTrackOutlineColor;
  final Color dividerColor;
  final Color splashColorDark;
  final Color splashColorLight;
  final Color loaderColor;
  final Color shimmerBackgroundColor;
  final Color shimmerOuterColor;
  final Color shimmerInnerColor;
  final Color positivePriceColor;
  final Color negativePriceColor;

  @override
  AppColors copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? primaryWidgetColor,
    Color? secondaryWidgetColor,
    Color? primaryTextColor,
    Color? secondaryTextColor,
    Color? hintTextColor,
    Color? iconColor,
    Color? shadowColor,
    Color? switchActiveColor,
    Color? switchActiveTrackColor,
    Color? switchInactiveTrackColor,
    Color? switchInactiveThumbColor,
    Color? switchTrackOutlineColor,
    Color? dividerColor,
    Color? splashColorDark,
    Color? splashColorLight,
    Color? loaderColor,
    Color? shimmerBackgroundColor,
    Color? shimmerOuterColor,
    Color? shimmerInnerColor,
    Color? positivePriceColor,
    Color? negativePriceColor,
  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryWidgetColor: primaryWidgetColor ?? this.primaryWidgetColor,
      secondaryWidgetColor: secondaryWidgetColor ?? this.secondaryWidgetColor,
      primaryTextColor: primaryTextColor ?? this.primaryTextColor,
      secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
      hintTextColor: hintTextColor ?? this.hintTextColor,
      iconColor: iconColor ?? this.iconColor,
      shadowColor: shadowColor ?? this.shadowColor,
      switchActiveColor: switchActiveColor ?? this.switchActiveColor,
      switchActiveTrackColor: switchActiveTrackColor ?? this.switchActiveTrackColor,
      switchInactiveTrackColor: switchInactiveTrackColor ?? this.switchInactiveTrackColor,
      switchInactiveThumbColor: switchInactiveThumbColor ?? this.switchInactiveThumbColor,
      switchTrackOutlineColor: switchTrackOutlineColor ?? this.switchTrackOutlineColor,
      dividerColor: dividerColor ?? this.dividerColor,
      splashColorDark: splashColorDark ?? this.splashColorDark,
      splashColorLight: splashColorLight ?? this.splashColorLight,
      loaderColor: loaderColor ?? this.loaderColor,
      shimmerBackgroundColor: shimmerBackgroundColor ?? this.shimmerBackgroundColor,
      shimmerOuterColor: shimmerOuterColor ?? this.shimmerOuterColor,
      shimmerInnerColor: shimmerInnerColor ?? this.shimmerInnerColor,
      positivePriceColor: positivePriceColor ?? this.positivePriceColor,
      negativePriceColor: negativePriceColor ?? this.negativePriceColor,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primaryWidgetColor: Color.lerp(primaryWidgetColor, other.primaryWidgetColor, t)!,
      secondaryWidgetColor: Color.lerp(secondaryWidgetColor, other.secondaryWidgetColor, t)!,
      primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t)!,
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      switchActiveColor: Color.lerp(switchActiveColor, other.switchActiveColor, t)!,
      switchActiveTrackColor: Color.lerp(switchActiveTrackColor, other.switchActiveTrackColor, t)!,
      switchInactiveTrackColor: Color.lerp(switchInactiveTrackColor, other.switchInactiveTrackColor, t)!,
      switchInactiveThumbColor: Color.lerp(switchInactiveThumbColor, other.switchInactiveThumbColor, t)!,
      switchTrackOutlineColor: Color.lerp(switchTrackOutlineColor, other.switchTrackOutlineColor, t)!,
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t)!,
      splashColorDark: Color.lerp(splashColorDark, other.splashColorDark, t)!,
      splashColorLight: Color.lerp(splashColorLight, other.splashColorLight, t)!,
      loaderColor: Color.lerp(loaderColor, other.loaderColor, t)!,
      shimmerBackgroundColor: Color.lerp(shimmerBackgroundColor, other.shimmerBackgroundColor, t)!,
      shimmerOuterColor: Color.lerp(shimmerOuterColor, other.shimmerOuterColor, t)!,
      shimmerInnerColor: Color.lerp(shimmerInnerColor, other.shimmerInnerColor, t)!,
      positivePriceColor: Color.lerp(positivePriceColor, other.positivePriceColor, t)!,
      negativePriceColor: Color.lerp(negativePriceColor, other.negativePriceColor, t)!,
    );
  }
}
