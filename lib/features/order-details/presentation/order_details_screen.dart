import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/common/widgets/custom_order_button.dart';
import 'package:idnshop/core/routes/app_routes.dart';
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
        physics: const AlwaysScrollableScrollPhysics(),
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
                              'Shipping Information'.toUpperCase(),
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
                    const Divider(height: 32),
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
                              'Items'.toUpperCase(),
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
                    const Divider(height: 32),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: data['items'].length,
                      itemBuilder: (context, index) {
                        final item = data['items'][index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed(AppRoutes.productDetails);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                color: CustomColor.accent1,
                                child: CustomCachedNetworkImage(
                                  imageUrl: item['image'],
                                  withErrorText: false,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${item['name']}'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Variant : ' +
                                          item['color'].toUpperCase() +
                                          ' - ' +
                                          item['size'].toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Quantity : x${item['qty']}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${item['qty']} x ${DataFormatter.formatCurrency(item['price'])} = ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          DataFormatter.formatCurrency(
                                              item['qty'] * item['price']),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w700),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
                              SvgData.payment,
                              colorFilter: const ColorFilter.mode(
                                CustomColor.secondary1,
                                BlendMode.srcIn,
                              ),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Billing Information'.toUpperCase(),
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
                    const Divider(height: 32),
                    Text(
                      'Billing Information bla bla bla kira2 apa aja',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      'Payment Method : MOBILE BANKING',
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
                              SvgData.paper,
                              colorFilter: const ColorFilter.mode(
                                CustomColor.secondary1,
                                BlendMode.srcIn,
                              ),
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Order Summary'.toUpperCase(),
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
                    const Divider(height: 32),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: CustomColor.lightGrey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Notes :',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'ny special instructions or notes from the customer regarding the order.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Subtotal : ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                DataFormatter.formatCurrency(data["total"]),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Shipping Fee : ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                DataFormatter.formatCurrency(25000),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Taxes : ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                DataFormatter.formatCurrency(0),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Admin Fee : ',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                DataFormatter.formatCurrency(2000),
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Order Total : ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                DataFormatter.formatCurrency(2000),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: CustomColor.primary,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        SvgPicture.asset(
                          SvgData.talk,
                          colorFilter: const ColorFilter.mode(
                            CustomColor.secondary1,
                            BlendMode.srcIn,
                          ),
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Thank you for shopping with IDNShop!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        alignment: WrapAlignment.end,
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          data['status'] == 'Pending'
                              ? CustomOrderButton(
                                  onPressed: () {},
                                  backgroundColor: CustomColor.red,
                                  label: 'Cancel',
                                  svgData: SvgData.close,
                                )
                              : const SizedBox.shrink(),
                          data['status'] == 'Arrived'
                              ? CustomOrderButton(
                                  onPressed: () {},
                                  backgroundColor: CustomColor.yellow,
                                  label: 'Return',
                                  svgData: SvgData.backReturn,
                                  svgColor: CustomColor.secondary1,
                                  textColor: CustomColor.secondary1,
                                )
                              : const SizedBox.shrink(),
                          data['status'] == 'Delivered'
                              ? CustomOrderButton(
                                  onPressed: () {},
                                  backgroundColor: CustomColor.secondary1,
                                  label: 'Track',
                                  svgData: SvgData.map,
                                )
                              : const SizedBox.shrink(),
                          data['status'] == 'Arrived'
                              ? CustomOrderButton(
                                  onPressed: () {},
                                  backgroundColor: CustomColor.primary,
                                  label: 'Confirm & Rate',
                                  svgData: SvgData.reviewsOutline,
                                )
                              : const SizedBox.shrink(),
                          data['status'] == 'Pending'
                              ? CustomOrderButton(
                                  onPressed: () {},
                                  backgroundColor: CustomColor.orange,
                                  label: 'Pay',
                                  svgData: SvgData.pay,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
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
