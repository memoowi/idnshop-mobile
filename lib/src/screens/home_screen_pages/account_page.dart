import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page_partials/account_information_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page_partials/account_setting_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page_partials/profile_image_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page_partials/support_section.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:lottie/lottie.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgData.bag,
              colorFilter: ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 4)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImageSection(),
            const Divider(),
            AccountInformationSection(),
            const Divider(),
            AccountSettingSection(),
            const Divider(),
            SupportSection(),
            const Divider(),
            ListTile(
              onTap: () {},
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: SvgPicture.asset(
                SvgData.logout,
                colorFilter: ColorFilter.mode(
                  CustomColor.red,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              title: Text(
                'Logout',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 50),
            Lottie.asset(
              'assets/lottie/custom-footer.json',
            ),
          ],
        ),
      ),
    );
  }
}
