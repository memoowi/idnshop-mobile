import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:idnshop/src/widgets/account_setting_tile.dart';

class AccountSettingSection extends StatelessWidget {
  const AccountSettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                SvgData.setting,
                colorFilter: ColorFilter.mode(
                  CustomColor.secondary1,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Account Setting',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          AccountSettingTile(
            onTap: () {},
            svgData: SvgData.shop,
            title: 'My Address',
            subtitle: 'Edit your address for shipping info',
          ),
          const SizedBox(height: 8),
          AccountSettingTile(
            onTap: () {},
            svgData: SvgData.lock2,
            title: 'Change Password',
            subtitle: 'Edit your password',
          ),
          const SizedBox(height: 8),
          AccountSettingTile(
            onTap: () {},
            svgData: SvgData.global,
            title: 'Privacy Settings',
            subtitle: 'Edit your address for shipping info',
          ),
        ],
      ),
    );
  }
}