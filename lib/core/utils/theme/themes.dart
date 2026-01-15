import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

export 'app_colors.dart';
export 'app_fonts.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF16C784),
  scaffoldBackgroundColor: const Color(0xFF191B21),
  highlightColor: kIsWeb ? const Color(0xFF272A33) : const Color(0xFF21232B),
  splashColor: kIsWeb ? const Color(0xFF272A33) : const Color(0xFF21232B),
  hoverColor: const Color(0xFF21232B),
  dividerTheme: const DividerThemeData(color: Colors.transparent),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
      value: (_) => const FadeForwardsPageTransitionsBuilder(),
      TargetPlatform.values,
    ),
  ),
  extensions: <ThemeExtension>[
    const AppColors(
      primaryColor: Color(0xFF16C784),
      secondaryColor: Color(0xFF3861FB),
      backgroundColor: Color(0xFF191B21),
      primaryWidgetColor: Color(0xFF21232B),
      secondaryWidgetColor: Color(0xFF272A33),
      primaryTextColor: Color(0xFFF0F6FC),
      secondaryTextColor: Color(0xFF8B96A3),
      hintTextColor: Color(0xFF8B96A3),
      iconColor: Color(0xFF8B96A3),
      shadowColor: Color(0xFF111317),
      switchActiveColor: Color(0xFFFFFFFF),
      switchActiveTrackColor: Color(0xFF16C784),
      switchInactiveTrackColor: Color(0xFF272A33),
      switchInactiveThumbColor: Color(0xFFFFFFFF),
      switchTrackOutlineColor: Color(0x00000000),
      dividerColor: Color(0xFF272A33),
      splashColorDark: Color(0xFF21232B),
      splashColorLight: Color(0xFF272A33),
      loaderColor: Color(0xFFF0F6FC),
      shimmerBackgroundColor: Color(0xFF21232B),
      shimmerOuterColor: Color(0xFF2F333D),
      shimmerInnerColor: Color(0xFF3A3E4A),
      positivePriceColor: Color(0xFF16C784),
      negativePriceColor: Color(0xFFED3841),
    ),
    const AppFonts(
      regular: TextStyle(
        color: Color(0xFFF0F6FC),
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
        height: 1.5,
      ),
      medium: TextStyle(
        color: Color(0xFFF0F6FC),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        height: 1.5,
      ),
      semiBold: TextStyle(
        color: Color(0xFFF0F6FC),
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        height: 1.5,
      ),
      bold: TextStyle(
        color: Color(0xFFF0F6FC),
        fontWeight: FontWeight.w700,
        fontSize: 16.0,
        height: 1.5,
      ),
      extraBold: TextStyle(
        color: Color(0xFFF0F6FC),
        fontWeight: FontWeight.w800,
        fontSize: 16.0,
        height: 1.5,
      ),
    ),
  ],
);
