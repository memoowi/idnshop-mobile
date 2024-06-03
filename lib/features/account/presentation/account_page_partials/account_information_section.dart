import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/account/presentation/update_profile/update_birth_date_dialog.dart';
import 'package:idnshop/features/account/widgets/verification_code_alert.dart';
import 'package:idnshop/features/account/presentation/update_profile/update_name_dialog.dart';
import 'package:idnshop/features/account/widgets/account_info_tile.dart';

class AccountInformationSection extends StatelessWidget {
  const AccountInformationSection({
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
                SvgData.user,
                colorFilter: const ColorFilter.mode(
                  CustomColor.secondary1,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Account Information',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16),
          AccountInfoTile(
            onTap: () {
              Clipboard.setData(ClipboardData(text: 'IDN123456789'));
              Fluttertoast.showToast(
                msg: 'Copied to clipboard',
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.black54,
              );
            },
            leading: 'User ID',
            title: 'IDN123456789',
            icon: Icons.copy,
          ),
          const SizedBox(height: 8),
          AccountInfoTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => UpdateNameDialog(),
              );
            },
            leading: 'Name',
            title: 'John Doe',
            icon: CupertinoIcons.chevron_forward,
          ),
          const SizedBox(height: 8),
          AccountInfoTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => UpdateBirthDateDialog(),
              );
            },
            leading: 'Birth Date',
            title: DataFormatter.ddMMMMyyyy(DateTime.now()),
            icon: CupertinoIcons.chevron_forward,
          ),
          const SizedBox(height: 8),
          AccountInfoTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => VerificationCodeAlert(),
              );
            },
            leading: 'Email',
            title: 'wPqFP@example.com',
            icon: CupertinoIcons.chevron_forward,
          ),
          const SizedBox(height: 8),
          AccountInfoTile(
            onTap: () {},
            leading: 'Phone',
            title: '+6281234567890',
            icon: CupertinoIcons.chevron_forward,
          ),
        ],
      ),
    );
  }
}
