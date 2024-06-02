import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';

class CustomTextButtonTheme {
  static TextButtonThemeData get defaultTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: CustomColor.secondary1,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            textStyle: const TextStyle(
              fontFamily: CustomTextTheme.baseFontFamily,
            )),
      );
}
