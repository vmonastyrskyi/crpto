import 'dart:ui';

abstract final class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  static const Color primaryColor = Color(0xFF734AC9);

  static const Color bodyBackgroundColor = Color(0xFF1B1B1B);
  static const Color widgetBackgroundColor = Color(0xFF282828);

  static const Color textColor = Color(0xFFEAEAEA);
  static const Color hintColor = Color(0xFF7C8186);
  static const Color iconColor = Color(0xFF7C8186);

  static const Color shadowColor = Color(0xFF383838);

  static const Color switchActiveColor = white;
  static const Color switchActiveTrackColor = primaryColor;
  static const Color switchInactiveTrackColor = Color(0xFF454D5A);
  static const Color switchInactiveThumbColor = white;
  static const Color switchTrackOutlineColor = transparent;
}
