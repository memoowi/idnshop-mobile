import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/utils/no_leading_spaces_formatter.dart';
import 'package:idnshop/common/utils/validate_new_password.dart';
import 'package:idnshop/common/widgets/password_form_field.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscureOldPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;

  void toggleObscureOldPassword() {
    setState(() {
      obscureOldPassword = !obscureOldPassword;
    });
  }

  void toggleObscureNewPassword() {
    setState(() {
      obscureNewPassword = !obscureNewPassword;
    });
  }

  void toggleObscureConfirmPassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  String? validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
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
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              PasswordFormField(
                obscureText: obscureOldPassword,
                toggleObscureText: toggleObscureOldPassword,
                controller: oldPasswordController,
                validator: validateOldPassword,
                hintText: 'Old Password',
                inputFormatters: [NoLeadingSpacesFormatter()],
              ),
              const SizedBox(height: 16.0),
              PasswordFormField(
                obscureText: obscureNewPassword,
                toggleObscureText: toggleObscureNewPassword,
                controller: newPasswordController,
                validator: validateNewPassword,
                hintText: 'New Password',
                inputFormatters: [NoLeadingSpacesFormatter()],
              ),
              const SizedBox(height: 16.0),
              PasswordFormField(
                obscureText: obscureConfirmPassword,
                toggleObscureText: toggleObscureConfirmPassword,
                controller: confirmPasswordController,
                validator: validateConfirmPassword,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 32.0),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        title: Text(
                          'Save changes?',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                          'Changing password will force logout your account across all of your devices',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('No'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    formKey.currentState!.reset();
                                    Fluttertoast.showToast(
                                      msg: 'Successfully changed password',
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: CustomColor.green,
                                      textColor: Colors.white,
                                      toastLength: Toast.LENGTH_SHORT,
                                    );
                                  },
                                  child: const Text('Yes'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Update Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
