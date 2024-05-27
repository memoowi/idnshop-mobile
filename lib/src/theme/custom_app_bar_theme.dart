import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/theme/custom_text_theme.dart';

class CustomAppBarTheme {
  static AppBarTheme get customAppBarTheme => AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: CustomColor.secondary1,
          toolbarHeight: 64,
          titleTextStyle: TextStyle(
            fontFamily: CustomTextTheme.headingFontFamily,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: CustomColor.secondary1,
          ),
        );
}