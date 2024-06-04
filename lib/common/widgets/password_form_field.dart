import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class PasswordFormField extends StatelessWidget {
  final bool obscureText;
  final VoidCallback toggleObscureText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;

  const PasswordFormField({
    super.key,
    required this.obscureText,
    required this.toggleObscureText,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset(
            SvgData.lock,
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
        suffixIcon: IconButton(
          onPressed: toggleObscureText,
          icon: SvgPicture.asset(
            obscureText ? SvgData.eye : SvgData.eyeOff,
            colorFilter: const ColorFilter.mode(
              CustomColor.primary,
              BlendMode.srcIn,
            ),
            width: 20.0,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0.0,
          minHeight: 0.0,
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      inputFormatters: inputFormatters,
    );
  }
}
