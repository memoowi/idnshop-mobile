import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/widgets/review_content.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews'.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed(AppRoutes.reviews);
                },
                child: Text(
                  'See all',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: CustomColor.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgData.starFill,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    CustomColor.yellow,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '(4.5)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const VerticalDivider(width: 20),
                Text(
                  '32 Reviews',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ReviewContent(),
        ],
      ),
    );
  }
}

