import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class SupportTile extends StatelessWidget {
  final Function()? onTap;
  final String svgData;
  final String title;
  const SupportTile({
    super.key,
    this.onTap,
    required this.svgData,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minTileHeight: 0,
      leading: SvgPicture.asset(
        svgData,
        colorFilter: ColorFilter.mode(
          CustomColor.secondary1,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
