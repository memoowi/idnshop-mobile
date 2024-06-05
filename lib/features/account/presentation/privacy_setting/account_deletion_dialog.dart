import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/utils/no_leading_spaces_formatter.dart';
import 'package:idnshop/common/widgets/password_form_field.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class AccountDeletionDialog extends StatefulWidget {
  const AccountDeletionDialog({
    super.key,
  });

  @override
  State<AccountDeletionDialog> createState() => _AccountDeletionDialogState();
}

class _AccountDeletionDialogState extends State<AccountDeletionDialog> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Request Account Deletion',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Are you sure you want to send request to delete your account? This action is permanent.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Form(
              key: formKey,
              child: PasswordFormField(
                obscureText: obscureText,
                toggleObscureText: toggleObscureText,
                controller: passwordController,
                validator: validatePassword,
                hintText: 'Password',
                inputFormatters: [NoLeadingSpacesFormatter()],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        Fluttertoast.showToast(
                          msg: 'Request sent successfully',
                          gravity: ToastGravity.TOP,
                          backgroundColor: CustomColor.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: CustomColor.red,
                    ),
                    child: const Text('Yes'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
