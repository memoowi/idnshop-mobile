import 'package:flutter/material.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/cart/widgets/cart_tile.dart';
import 'package:idnshop/features/cart/widgets/delete_cart_dialog.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      // body: EmptyCart(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CheckboxListTile(
                value: true,
                onChanged: (value) {},
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: CustomColor.primary,
                shape: Border.all(
                  color: CustomColor.border,
                ),
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  'Select All (5)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                secondary: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteCartDialog();
                      },
                    );
                  },
                  child: Text(
                    'Delete',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 3,
                itemBuilder: (context, index) => const CartTile(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: CustomColor.border,
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Subtotal (2 items)',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    DataFormatter.formatCurrency(100000),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: () {},
                child: const Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
