import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';

class CustomFilledButtonTheme {
  static FilledButtonThemeData get defaultTheme => FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: CustomColor.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: CustomColor.primary.withOpacity(0.5),
          disabledForegroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          textStyle: const TextStyle(
            fontFamily: CustomTextTheme.baseFontFamily,
            fontWeight: FontWeight.w600,
          ),
          minimumSize: const Size(100, 50),
        ),
      );
}
