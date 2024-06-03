import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class CustomInputDecorationTheme {
  static InputDecorationTheme get defaultTheme => const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColor.border),
          borderRadius: BorderRadius.zero,
        ),
        // enabledBorder: OutlineInputBorder(),
        // focusedBorder: OutlineInputBorder(),
        // errorBorder: OutlineInputBorder(),
        // focusedErrorBorder: OutlineInputBorder(),
        isDense: true,
      );
}
