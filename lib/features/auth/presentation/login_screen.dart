import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/utils/no_leading_spaces_formatter.dart';
import 'package:idnshop/common/widgets/input_prefix_form_field.dart';
import 'package:idnshop/common/widgets/password_form_field.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  String? validateUser(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
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
              'assets/images/login.jpg',
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
                            'Login'.toUpperCase(),
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
                        controller: userController,
                        validator: validateUser,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'Email / Phone Number',
                        svgData: SvgData.user,
                        inputFormatters: [NoLeadingSpacesFormatter()],
                      ),
                      const SizedBox(height: 16),
                      PasswordFormField(
                        obscureText: obscureText,
                        toggleObscureText: toggleObscureText,
                        controller: passwordController,
                        validator: validatePassword,
                        hintText: 'Password',
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
                        child: const Text('Login'),
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
                            const Text('Login with Google'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushReplacementNamed(AppRoutes.register);
                            },
                            child: Text(
                              'Create Account',
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
