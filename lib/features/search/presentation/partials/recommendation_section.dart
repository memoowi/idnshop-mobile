import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/product_card.dart';
import 'package:idnshop/features/main_page/data/product_data.dart';

class RecommendationSection extends StatelessWidget {
  RecommendationSection({
    super.key,
  });

  final data = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Recommended for you',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 5.3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: data.length > 4 ? 4 : data.length,
          itemBuilder: (context, index) {
            return ProductCard(
              onTap: () {},
              product: data[index],
            );
          },
        ),
      ],
    );
  }
}
