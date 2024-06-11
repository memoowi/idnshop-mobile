import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/common/widgets/custom_order_button.dart';

class OrderTile extends StatelessWidget {
  final Function()? onTap;
  final Map<dynamic, dynamic> order;
  const OrderTile({
    super.key,
    this.onTap,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColor.border),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  SvgData.product,
                  colorFilter: const ColorFilter.mode(
                    CustomColor.primary,
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID : ${order['id']}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        DataFormatter.ddMMyyyy(
                            DateTime.parse(order['order_date'])),
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '${order['status']}'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: CustomColor.primary),
                ),
              ],
            ),
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: CustomColor.accent1,
                  ),
                  child: CustomCachedNetworkImage(
                    imageUrl: order['items'][0]['image'],
                    fit: BoxFit.cover,
                    withErrorText: false,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${order['items'][0]['name']}'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Variant : ' +
                            order['items'][0]['color'].toUpperCase() +
                            ' - ' +
                            order['items'][0]['size'].toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Quantity : x${order['items'][0]['qty']}',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DataFormatter.formatCurrency(
                                order['items'][0]['price']),
                            style: Theme.of(context).textTheme.bodySmall,
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
            const Divider(),
            Text(
              'Show more products',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  '${order['items'].length} products',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const Spacer(),
                Text('Order Total : ',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  DataFormatter.formatCurrency(order['total']),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColor.primary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 4,
                runSpacing: 4,
                children: [
                  order['status'] == 'Pending'
                      ? CustomOrderButton(
                          onPressed: () {},
                          backgroundColor: CustomColor.red,
                          label: 'Cancel',
                          svgData: SvgData.close,
                        )
                      : const SizedBox.shrink(),
                  order['status'] == 'Arrived'
                      ? CustomOrderButton(
                          onPressed: () {},
                          backgroundColor: CustomColor.yellow,
                          label: 'Return',
                          svgData: SvgData.backReturn,
                          svgColor: CustomColor.secondary1,
                          textColor: CustomColor.secondary1,
                        )
                      : const SizedBox.shrink(),
                  order['status'] == 'Delivered'
                      ? CustomOrderButton(
                          onPressed: () {},
                          backgroundColor: CustomColor.secondary1,
                          label: 'Track',
                          svgData: SvgData.map,
                        )
                      : const SizedBox.shrink(),
                  order['status'] == 'Arrived'
                      ? CustomOrderButton(
                          onPressed: () {},
                          backgroundColor: CustomColor.primary,
                          label: 'Confirm & Rate',
                          svgData: SvgData.reviewsOutline,
                        )
                      : const SizedBox.shrink(),
                  order['status'] == 'Pending'
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
    );
  }
}
