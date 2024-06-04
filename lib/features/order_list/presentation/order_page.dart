import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/no_orders_found.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/order_list_section.dart';
import 'package:idnshop/common/widgets/footer.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/status_filter.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        automaticallyImplyLeading: false,
        actions: const [OpenCartButton(), SizedBox(width: 4)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatusFilter(),
            // NoOrdersFound(),
            OrderListSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
