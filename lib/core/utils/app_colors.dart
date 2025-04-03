import 'dart:ui';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  static const Color primaryColor = Color(0xFF16C784);
  static const Color secondaryColor = Color(0xFF3861FB);

  static const Color bodyBackgroundColor = Color(0xFF181A20);
  static const Color widgetBackgroundColorDark = Color(0xFF21232B);
  static const Color widgetBackgroundColorLight = Color(0xFF282C36);

  static const Color primaryTextColor = Color(0xFFE2E6EA);
  static const Color secondaryTextColor = Color(0xFF848E9C);
  static const Color hintTextColor = secondaryTextColor;
  static const Color iconColor = secondaryTextColor;

  static const Color shadowColor = Color(0x33111317);

  static const Color switchActiveColor = white;
  static const Color switchActiveTrackColor = primaryColor;
  static const Color switchInactiveTrackColor = widgetBackgroundColorLight;
  static const Color switchInactiveThumbColor = white;
  static const Color switchTrackOutlineColor = transparent;

  static const Color dividerColorDark = Color(0xFF282C36);
  static const Color dividerColorLight = Color(0xFF2F3440);

  static const Color splashColorDark = Color(0xFF21232B);
  static const Color splashColorLight = Color(0xFF282C36);

  static const Color loaderColor = primaryTextColor;

  static const Color positivePriceColor = Color(0xFF16C784);
  static const Color negativePriceColor = Color(0xFFEA3943);
}
