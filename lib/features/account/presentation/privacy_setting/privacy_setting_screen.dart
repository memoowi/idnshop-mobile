import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/account/presentation/privacy_setting/account_deletion_dialog.dart';

class PrivacySettingScreen extends StatelessWidget {
  const PrivacySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Request Account Deletion',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AccountDeletionDialog(),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(0, 40),
                    backgroundColor: CustomColor.red,
                  ),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
