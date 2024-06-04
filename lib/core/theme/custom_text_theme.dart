import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class CustomTextTheme {
  static const String baseFontFamily = 'Nunito';
  static const String headingFontFamily = 'Rubik';
  static const String brandFontFamily = 'Squada One';

  static TextTheme get defaultTheme => TextTheme(
        headlineLarge: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 24
        ),
        headlineMedium: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 16
        ),
        headlineSmall: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 14
        ),
        titleLarge: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 20
        ),
        titleMedium: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 16
        ),
        titleSmall: const TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 14
        ),
        bodyLarge: const TextStyle(
          color: CustomColor.secondary1, // df:fs 16
        ),
        bodyMedium: const TextStyle(
          color: CustomColor.secondary1, // df:fs 14
        ),
        bodySmall: const TextStyle(
          color: CustomColor.secondary1, // df:fs 12
        ),
        labelLarge: TextStyle(
          color: CustomColor.secondary1.withOpacity(0.5), // df:fs 14
        ),
        labelMedium: TextStyle(
          color: CustomColor.secondary1.withOpacity(0.5), // df:fs 12
        ),
        labelSmall: TextStyle(
          color: CustomColor.secondary1.withOpacity(0.5), // df:fs 10
        ),
      );
}
