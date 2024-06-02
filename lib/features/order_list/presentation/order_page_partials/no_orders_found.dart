import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoOrdersFound extends StatelessWidget {
  const NoOrdersFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Lottie.asset(
            'assets/lottie/file-not-found.json',
            width: 300,
          ),
          const SizedBox(height: 24),
          Text(
            'No Orders Yet'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'You can place an order from the shop page.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
