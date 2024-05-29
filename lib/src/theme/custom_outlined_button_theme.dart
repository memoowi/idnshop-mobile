import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class CustomOutlinedButtonTheme {
  static OutlinedButtonThemeData get defaultTheme => OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        minimumSize: Size(100, 50),
        side: const BorderSide(color: CustomColor.secondary1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        foregroundColor: CustomColor.secondary1,
        disabledBackgroundColor: CustomColor.lightGrey,
        disabledForegroundColor: CustomColor.secondary1.withOpacity(0.5),
      ));
}
