import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/order_list/presentation/order_page_partials/order_list_section.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderDetailsScreen({super.key});

  final data = OrderListSection.orders[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        actions: [
          Text(
            '${data['status']}'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: '${data['id']}'));
                  Fluttertoast.showToast(
                    msg: 'Copied to clipboard',
                    gravity: ToastGravity.TOP,
                    backgroundColor: CustomColor.secondary1.withOpacity(0.8),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    border: Border.all(color: CustomColor.border),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order ID',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${data['id']}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: CustomColor.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgData.shippingFast,
                              colorFilter: const ColorFilter.mode(
                                CustomColor.secondary1,
                                BlendMode.srcIn,
                              ),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Shipping Information',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'JNE - Regular',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                            Text(
                              '12-3456-7890',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    Text(
                      'Misbach',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '088232220652',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Jalan Jababeka Kawasan Industri Jababeka Blok F/2-A, Cikarang Utara, KAB. BEKASI, CIKARANG UTARA, JAWA BARAT',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Indonesia',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      '17530',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  border: Border.all(color: CustomColor.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgData.productList,
                              colorFilter: const ColorFilter.mode(
                                CustomColor.secondary1,
                                BlendMode.srcIn,
                              ),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Items',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    // NEXT
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
