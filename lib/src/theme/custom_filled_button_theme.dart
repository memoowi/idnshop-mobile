import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

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
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
          minimumSize: const Size(100, 50),
        ),
      );
}
