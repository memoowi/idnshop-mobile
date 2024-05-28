import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({
    super.key,
  });

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
                colorFilter: ColorFilter.mode(
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
          GridView.extent(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3 / 5.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            maxCrossAxisExtent: 300,
            children: [
              ...List.generate(
                6,
                (index) => InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Container(
                            color: CustomColor.accent1,
                            child: Image.network(
                              'https://i.ibb.co.com/VCYgdN1/shirt.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ProductProductProductProductProduct',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'IDR 1,000,000',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: CustomColor.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBarIndicator(
                                    rating: 4.0,
                                    itemBuilder: (context, index) =>
                                        SvgPicture.asset(
                                      SvgData.starFill,
                                      colorFilter: ColorFilter.mode(
                                        CustomColor.secondary1,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    unratedColor: CustomColor.border,
                                    itemCount: 5,
                                    itemSize: 16.0,
                                    itemPadding: EdgeInsets.only(
                                      right: 2.0,
                                    ),
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    '(28)',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('View All'),
          ),
        ],
      ),
    );
  }
}
