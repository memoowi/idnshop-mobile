import 'package:flutter/material.dart';
import 'package:idnshop/features/order_list/widgets/order_tile.dart';

class OrderListSection extends StatelessWidget {
  OrderListSection({
    super.key,
  });

  List<Map<dynamic, dynamic>> get orders => [
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Pending",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://i.ibb.co.com/ZBv3QNN/js.png",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Packed",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Delivered",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Arrived",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Completed",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Canceled",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
        {
          "id": 'IVR/20240203/XXIV/II/1929971609',
          "status": "Return",
          "order_date": "2023-12-31 23:59:59.000000",
          "items": [
            {
              "name": "Shoes",
              "image": "https://picsum.photos/200",
              "qty": 1,
              "color": "violet",
              "size": "xl",
              "price": 200000,
            },
          ],
          "total": 200000,
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          ...List.generate(
            orders.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: OrderTile(
                order: orders[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
