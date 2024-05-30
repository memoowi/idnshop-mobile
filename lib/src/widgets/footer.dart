import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Text(
            'from',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SvgPicture.asset(
            SvgData.idnshopDark,
            colorFilter: ColorFilter.mode(
              CustomColor.primary,
              BlendMode.srcIn,
            ),
            height: 24,
          ),
        ],
      ),
    );
  }
}
