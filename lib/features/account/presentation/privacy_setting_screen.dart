import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/core/theme/custom_color.dart';

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
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        title: Text(
                          'Request Account Deletion',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                          'Are you sure you want to send request to delete your account? This action is permanent.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
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
                                    Navigator.of(context).pop();
                                    Fluttertoast.showToast(
                                      msg: 'Request sent successfully',
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: CustomColor.red,
                                      textColor: Colors.white,
                                    );
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
