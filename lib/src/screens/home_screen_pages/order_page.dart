import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/screens/home_screen_pages/order_page_partials/no_orders_found.dart';
import 'package:idnshop/src/screens/home_screen_pages/order_page_partials/status_filter.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';

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
            NoOrdersFound(),
          ],
        ),
      ),
    );
  }
}
