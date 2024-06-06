import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/features/main_page/data/product_data.dart';

class ProductCard extends StatelessWidget {
  final ProductData product;
  final Function()? onTap;
  final bool showStars;
  final bool showBorder;
  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.showStars = false,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: showBorder
              ? Border.all(
                  color: Colors.white,
                  width: 4,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                color: CustomColor.accent1,
                child: CustomCachedNetworkImage(
                  imageUrl: product.imageUrl,
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
                    product.title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DataFormatter.formatCurrency(product.price),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColor.primary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  showStars
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RatingBarIndicator(
                              rating: product.rating,
                              itemBuilder: (context, index) => SvgPicture.asset(
                                SvgData.starFill,
                                colorFilter: ColorFilter.mode(
                                  CustomColor.secondary1,
                                  BlendMode.srcIn,
                                ),
                              ),
                              unratedColor: CustomColor.border,
                              itemCount: 5,
                              itemSize: 14.0,
                              itemPadding: EdgeInsets.only(
                                right: 2.0,
                              ),
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(${product.sold} sold)',
                              style: Theme.of(context).textTheme.bodyMedium,
                            )
                          ],
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
