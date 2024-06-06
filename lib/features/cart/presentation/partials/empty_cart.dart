import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            LottieData.emptyBox,
            width: 300,
          ),
          const SizedBox(height: 24),
          Text(
            'Your cart is empty'.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            '(You’re missing out is all we’re saying.)',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
