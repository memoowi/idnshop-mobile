import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/common/widgets/custom_rating_bar.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class ProductHeadSection extends StatelessWidget {
  const ProductHeadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category Name / Collection',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            'Product Name'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          IntrinsicHeight(
            child: Row(
              children: [
                const CustomRatingBar(
                  rating: 4.5,
                ),
                const SizedBox(width: 4),
                Text(
                  '(4.5)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalDivider(width: 32),
                Text(
                  '32 Reviews',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalDivider(width: 32),
                Text(
                  '40 Sold',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            DataFormatter.formatCurrency(100000000),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: CustomColor.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Color: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'Black',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              ...List.generate(
                5,
                (index) => Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: CustomColor.accent2,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Size',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              ...List.generate(
                5,
                (index) => Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CustomColor.secondary1,
                      width: 1,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'S',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset(
                SvgData.clock,
                colorFilter: const ColorFilter.mode(
                  CustomColor.secondary1,
                  BlendMode.srcIn,
                ),
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Maximum 5 days processing time before shipment. More details on Shipping & Delivery Policy.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(
                SvgData.truck,
                colorFilter: const ColorFilter.mode(
                  CustomColor.secondary1,
                  BlendMode.srcIn,
                ),
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Hassle free 7 days return & exchange. More details on Return Policy.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
