import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';

class CustomOutlinedButtonTheme {
  static OutlinedButtonThemeData get defaultTheme => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            minimumSize: const Size(100, 50),
            side: const BorderSide(color: CustomColor.secondary1),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            foregroundColor: CustomColor.secondary1,
            disabledBackgroundColor: CustomColor.lightGrey,
            disabledForegroundColor: CustomColor.secondary1.withOpacity(0.5),
            textStyle: const TextStyle(
              fontFamily: CustomTextTheme.baseFontFamily,
            )),
      );
}
