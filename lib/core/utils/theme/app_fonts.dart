import 'package:flutter/material.dart';

extension AppFontsX on BuildContext {
  AppFonts get appFonts => Theme.of(this).extension<AppFonts>()!;
}

@immutable
class AppFonts extends ThemeExtension<AppFonts> {
  const AppFonts({
    required this.regular,
    required this.medium,
    required this.semiBold,
    required this.bold,
    required this.extraBold,
  });

  final TextStyle regular;
  final TextStyle medium;
  final TextStyle semiBold;
  final TextStyle bold;
  final TextStyle extraBold;

  @override
  AppFonts copyWith({
    TextStyle? regular,
    TextStyle? medium,
    TextStyle? semiBold,
    TextStyle? bold,
    TextStyle? extraBold,
  }) {
    return AppFonts(
      regular: regular ?? this.regular,
      medium: medium ?? this.medium,
      semiBold: semiBold ?? this.semiBold,
      bold: bold ?? this.bold,
      extraBold: extraBold ?? this.extraBold,
    );
  }

  @override
  AppFonts lerp(covariant AppFonts? other, double t) {
    if (other is! AppFonts) return this;

    return AppFonts(
      regular: TextStyle.lerp(regular, other.regular, t)!,
      medium: TextStyle.lerp(medium, other.medium, t)!,
      semiBold: TextStyle.lerp(semiBold, other.semiBold, t)!,
      bold: TextStyle.lerp(bold, other.bold, t)!,
      extraBold: TextStyle.lerp(extraBold, other.extraBold, t)!,
    );
  }
}
