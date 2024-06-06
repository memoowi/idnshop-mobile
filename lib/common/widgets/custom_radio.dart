import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  final int value;
  final int? groupValue;
  final void Function(int?)? onChanged;
  final String title;
  const CustomRadio({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      dense: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
