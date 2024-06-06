import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:idnshop/features/account/presentation/account_page_partials/account_information_section.dart';
import 'package:idnshop/features/account/presentation/account_page_partials/account_setting_section.dart';
import 'package:idnshop/features/account/presentation/account_page_partials/profile_image_section.dart';
import 'package:idnshop/features/account/presentation/account_page_partials/support_section.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:lottie/lottie.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false,
        actions: const [OpenCartButton(), SizedBox(width: 4)],
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Logout',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Are you sure you want to logout?',
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {},
                                  style: FilledButton.styleFrom(
                                    backgroundColor: CustomColor.red,
                                  ),
                                  child: const Text('Logout'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 24),
              leading: SvgPicture.asset(
                SvgData.logout,
                colorFilter: const ColorFilter.mode(
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
              LottieData.customFooterAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
