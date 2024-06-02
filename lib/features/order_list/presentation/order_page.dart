import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/no_orders_found.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/order_list_section.dart';
import 'package:idnshop/common/widgets/footer.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/status_filter.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgData.bag,
              colorFilter: ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 4)
        ],
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
