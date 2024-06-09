import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/utils/no_leading_spaces_formatter.dart';
import 'package:idnshop/common/utils/validate_new_password.dart';
import 'package:idnshop/common/widgets/input_prefix_form_field.dart';
import 'package:idnshop/common/widgets/password_form_field.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscureText = true;
  bool obscureConfirmPassword = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void toggleObscureConfirmPassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    } else if (!value.contains(RegExp(r'^(?=.*[a-zA-Z])[a-zA-Z0-9 ]+$'))) {
      return 'Invalid name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!value.contains(RegExp(r'^[0-9]+$'))) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    return ValidateNewPassword.validate(value: value, minLength: 8);
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/register.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                margin: const EdgeInsets.all(16),
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                color: Colors.white.withOpacity(0.7),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SvgData.printSquareFilled,
                            colorFilter: const ColorFilter.mode(
                              CustomColor.secondary1,
                              BlendMode.srcIn,
                            ),
                            width: 18,
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgData.printSquare,
                            colorFilter: const ColorFilter.mode(
                              CustomColor.secondary1,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Register'.toUpperCase(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgData.printSquareFilled,
                            colorFilter: const ColorFilter.mode(
                              CustomColor.secondary1,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            SvgData.printSquare,
                            colorFilter: const ColorFilter.mode(
                              CustomColor.secondary1,
                              BlendMode.srcIn,
                            ),
                            width: 18,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      InputPrefixFormField(
                        controller: nameController,
                        validator: validateName,
                        keyboardType: TextInputType.name,
                        hintText: 'Name',
                        svgData: SvgData.user,
                        inputFormatters: [NoLeadingSpacesFormatter()],
                      ),
                      const SizedBox(height: 16),
                      InputPrefixFormField(
                        controller: emailController,
                        validator: validateEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email',
                        svgData: SvgData.atSign,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s'))
                        ],
                      ),
                      const SizedBox(height: 16),
                      InputPrefixFormField(
                        controller: phoneController,
                        validator: validatePhone,
                        keyboardType: TextInputType.phone,
                        hintText: 'Phone Number',
                        svgData: SvgData.hash,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      const SizedBox(height: 16),
                      PasswordFormField(
                        obscureText: obscureText,
                        toggleObscureText: toggleObscureText,
                        controller: passwordController,
                        validator: validateNewPassword,
                        hintText: 'Password',
                        inputFormatters: [NoLeadingSpacesFormatter()],
                      ),
                      const SizedBox(height: 16),
                      PasswordFormField(
                        obscureText: obscureConfirmPassword,
                        toggleObscureText: toggleObscureConfirmPassword,
                        controller: confirmPasswordController,
                        validator: validateConfirmPassword,
                        hintText: 'Confirm Password',
                        inputFormatters: [NoLeadingSpacesFormatter()],
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pop();
                          }
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Continue'),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          const SizedBox(width: 8),
                          Text(
                            'OR',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              SvgData.googleColor,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text('Signup with Google'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacementNamed(AppRoutes.login);
                            },
                            child: Text(
                              'Login',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: CustomColor.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
