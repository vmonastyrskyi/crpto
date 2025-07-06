import 'dart:ui';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static const Color primaryColor = Color(0xFF16C784);
  static const Color secondaryColor = Color(0xFF3861FB);

  static const Color backgroundColor = Color(0xFF191B21);
  static const Color primaryWidgetColor = Color(0xFF21232B);
  static const Color secondaryWidgetColor = Color(0xFF272A33);

  static const Color primaryTextColor = Color(0xFFF0F6FC);
  static const Color secondaryTextColor = Color(0xFF8B96A3);
  static const Color hintTextColor = secondaryTextColor;
  static const Color iconColor = secondaryTextColor;

  static const Color shadowColor = Color(0xFF111317);

  static const Color switchActiveColor = white;
  static const Color switchActiveTrackColor = primaryColor;
  static const Color switchInactiveTrackColor = secondaryWidgetColor;
  static const Color switchInactiveThumbColor = white;
  static const Color switchTrackOutlineColor = transparent;

  static const Color dividerColor = secondaryWidgetColor;

  static const Color splashColorDark = primaryWidgetColor;
  static const Color splashColorLight = secondaryWidgetColor;

  static const Color loaderColor = primaryTextColor;

  static const Color shimmerBackgroundColor = primaryWidgetColor;
  static const Color shimmerOuterColor = Color(0xFF2F333D);
  static const Color shimmerInnerColor = Color(0xFF3A3E4A);

  static const Color positivePriceColor = Color(0xFF16C784);
  static const Color negativePriceColor = Color(0xFFED3841);
}
