import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class InputPrefixFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final String svgData;

  const InputPrefixFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.hintText,
    this.autofillHints,
    this.inputFormatters,
    required this.svgData,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset(
            svgData,
            colorFilter: const ColorFilter.mode(
              CustomColor.primary,
              BlendMode.srcIn,
            ),
            width: 20.0,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      inputFormatters: inputFormatters,
    );
  }
}
