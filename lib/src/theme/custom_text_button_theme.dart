import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class CustomTextButtonTheme {
  static TextButtonThemeData get defaultTheme => TextButtonThemeData(
        // style: ButtonStyle(
        //   foregroundColor: WidgetStateProperty.all(CustomColor.secondary1),
        //   padding: WidgetStateProperty.all(EdgeInsets.zero),
        //   minimumSize: WidgetStateProperty.all(Size.zero),
        //   shape: WidgetStateProperty.all(
        //     RoundedRectangleBorder(
        //       borderRadius: BorderRadius.zero,
        //     ),
        //   ),
        // ),
        style: TextButton.styleFrom(
          foregroundColor: CustomColor.secondary1,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      );
}
