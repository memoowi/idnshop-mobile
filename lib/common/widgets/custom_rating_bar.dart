import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class CustomRatingBar extends StatelessWidget {
  final double rating;
  const CustomRatingBar({
    super.key, required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => SvgPicture.asset(
        SvgData.starFill,
        colorFilter: const ColorFilter.mode(
          CustomColor.secondary1,
          BlendMode.srcIn,
        ),
      ),
      unratedColor: CustomColor.border,
      itemCount: 5,
      itemSize: 14.0,
      itemPadding: const EdgeInsets.only(right: 2.0),
      direction: Axis.horizontal,
    );
  }
}
