import 'dart:ui';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF232323);
  static const Color transparent = Color(0x00000000);

  static const Color primaryColor = Color(0xFF734AC9);

  static const Color bodyBackgroundColor = Color(0xFF1B1B1B);
  static const Color widgetBackgroundColorDark = Color(0xFF2A2A2A);
  static const Color widgetBackgroundColorLight = Color(0xFF393939);

  static const Color primaryTextColor = Color(0xFFEAEAEA);
  static const Color secondaryTextColor = Color(0xFF7C8186);
  static const Color hintTextColor = Color(0xFF7C8186);
  static const Color iconColor = Color(0xFF7C8186);

  static const Color shadowColor = Color(0xFF383838);

  static const Color switchActiveColor = white;
  static const Color switchActiveTrackColor = primaryColor;
  static const Color switchInactiveTrackColor = Color(0xFF454D5A);
  static const Color switchInactiveThumbColor = white;
  static const Color switchTrackOutlineColor = transparent;

  static const Color loaderColor = primaryTextColor;

  static const Color positivePriceColor = Color(0xFF3BBD81);
  static const Color negativePriceColor = Color(0xFFFF5B5B);
}
