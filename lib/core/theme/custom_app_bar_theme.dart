import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';

class CustomAppBarTheme {
  static AppBarTheme get defaultTheme => const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: CustomColor.secondary1,
        surfaceTintColor: Colors.white,
        shadowColor: CustomColor.lightGrey,
        scrolledUnderElevation: 2,
        toolbarHeight: 64,
        iconTheme: IconThemeData(
          color: CustomColor.secondary1,
        ),
        titleTextStyle: TextStyle(
          fontFamily: CustomTextTheme.headingFontFamily,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: CustomColor.secondary1,
        ),
      );
}
