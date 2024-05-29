import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:idnshop/src/widgets/account_setting_tile.dart';
import 'package:idnshop/src/widgets/support_tile.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      visualDensity: VisualDensity.compact,
      childrenPadding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Row(
        children: [
          SvgPicture.asset(
            SvgData.help,
            colorFilter: ColorFilter.mode(
              CustomColor.secondary1,
              BlendMode.srcIn,
            ),
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          Text(
            'Support',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      children: [
        SupportTile(
          onTap: () {},
          svgData: SvgData.questionSquare,
          title: 'FAQs',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {},
          svgData: SvgData.privacyPolicy,
          title: 'Privacy Policy',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {},
          svgData: SvgData.fileLock,
          title: 'Terms and Use',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {},
          svgData: SvgData.documentTableTruck,
          title: 'Shipping and Delivery',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {},
          svgData: SvgData.documentDataLock,
          title: 'Return Policy',
        ),
      ],
    );
  }
}
