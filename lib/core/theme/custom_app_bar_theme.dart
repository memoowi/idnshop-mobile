import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';

class CustomAppBarTheme {
  static AppBarTheme get defaultTheme => AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: CustomColor.secondary1,
        surfaceTintColor: Colors.white,
        shadowColor: CustomColor.lightGrey,
        scrolledUnderElevation: 2,
        toolbarHeight: 64,
        titleTextStyle: TextStyle(
          fontFamily: CustomTextTheme.headingFontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: CustomColor.secondary1,
        ),
      );
}
