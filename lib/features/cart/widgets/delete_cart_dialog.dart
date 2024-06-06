import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class DeleteCartDialog extends StatelessWidget {
  const DeleteCartDialog({
    super.key,
  });

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
              'Delete 2 Items',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Selected items will be removed from your cart.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
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
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                        msg: 'Items has been deleted',
                        gravity: ToastGravity.TOP,
                        backgroundColor: CustomColor.green,
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: CustomColor.red,
                    ),
                    child: const Text('Delete'),
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
