import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/common/widgets/product_card.dart';
import 'package:idnshop/features/main_page/data/product_data.dart';

class BestSellingSection extends StatelessWidget {
  BestSellingSection({
    super.key,
  });

  final data = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: CustomColor.lightGrey,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgData.printHash,
                colorFilter: const ColorFilter.mode(
                  CustomColor.primary,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Best Selling Products'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 18),
              ),
            ],
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
            itemCount: data.length,
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
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('View All'),
          ),
        ],
      ),
    );
  }
}
