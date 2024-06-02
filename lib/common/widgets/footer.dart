import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        children: [
          const Divider(color: CustomColor.lightGrey),
          const SizedBox(height: 16),
          Text(
            'from',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SvgPicture.asset(
            SvgData.idnshopDark,
            colorFilter: const ColorFilter.mode(
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
