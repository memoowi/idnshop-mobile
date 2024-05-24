import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class CustomFilledButtonTheme {
  static FilledButtonThemeData get customFilledButtonTheme =>
      FilledButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(CustomColor.primary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          textStyle: WidgetStateProperty.all(const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
          minimumSize: WidgetStateProperty.all(const Size(100, 50)),
        ),
      );
}
