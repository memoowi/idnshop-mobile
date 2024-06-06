import 'dart:developer';

import 'package:flutter/services.dart';

class NoLeadingSpacesFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String trimmedText = newValue.text.trimLeft();

    if (newValue.text != trimmedText) {
      log('trimmedText: $trimmedText');
      int offset = newValue.selection.end;

      if (offset > trimmedText.length) {
        offset = trimmedText.length;
      }

      return TextEditingValue(
        text: trimmedText,
        selection: TextSelection.collapsed(offset: offset),
      );
    }

    return newValue;
  }
}
