import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/product_card.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/main_page/data/product_data.dart';

class MoreProductSection extends StatelessWidget {
  MoreProductSection({
    super.key,
  });

  final data = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.lightGrey,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You might also like'.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 5.5,
              // mainAxisExtent: 400,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: data.length > 4 ? 4 : data.length,
            itemBuilder: (context, index) {
              return ProductCard(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.productDetails);
                },
                product: data[index],
                showBorder: true,
                showStars: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
