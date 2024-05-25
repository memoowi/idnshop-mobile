import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class CustomTextTheme {
  static const String baseFontFamily = 'Nunito';
  static const String headingFontFamily = 'Rubik';
  static const String brandFontFamily = 'Squada One';

  static TextTheme get customTextTheme => TextTheme(
        headlineLarge: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 24
        ),
        headlineMedium: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 16
        ),
        headlineSmall: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 14
        ),
        titleLarge: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 20
        ),
        titleMedium: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 16
        ),
        titleSmall: TextStyle(
          fontFamily: headingFontFamily,
          color: CustomColor.secondary1,
          fontWeight: FontWeight.w700, // df:fs 14
        ),
        bodyLarge: TextStyle(
          color: CustomColor.secondary1, // df:fs 16
        ),
        bodyMedium: TextStyle(
          color: CustomColor.secondary1, // df:fs 14
        ),
        bodySmall: TextStyle(
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
