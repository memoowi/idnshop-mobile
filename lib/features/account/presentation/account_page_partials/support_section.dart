import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/account/widgets/support_tile.dart';
import 'package:idnshop/features/policy/data/policy_type.dart';
import 'package:idnshop/features/policy/data/policy_data_source.dart';
import 'package:idnshop/features/policy/data/policy_data_source_impl.dart';
import 'package:idnshop/features/policy/presentation/support_bottom_sheet.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      visualDensity: VisualDensity.compact,
      childrenPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      title: Row(
        children: [
          SvgPicture.asset(
            SvgData.help,
            colorFilter: const ColorFilter.mode(
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
          onTap: () {
            Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.faq);
          },
          svgData: SvgData.questionSquare,
          title: 'FAQs',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {
            showCustomSheet(
              context: context,
              dataSource: PolicyDataSourceImpl(),
              policyType: PolicyType.privacyPolicy,
            );
          },
          svgData: SvgData.privacyPolicy,
          title: 'Privacy Policy',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {
            showCustomSheet(
              context: context,
              dataSource: PolicyDataSourceImpl(),
              policyType: PolicyType.termsOfUse,
            );
          },
          svgData: SvgData.fileLock,
          title: 'Terms and Use',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {
            showCustomSheet(
              context: context,
              dataSource: PolicyDataSourceImpl(),
              policyType: PolicyType.shippingAndDeliveryPolicy,
            );
          },
          svgData: SvgData.documentTableTruck,
          title: 'Shipping and Delivery',
        ),
        const SizedBox(height: 8),
        SupportTile(
          onTap: () {
            showCustomSheet(
              context: context,
              dataSource: PolicyDataSourceImpl(),
              policyType: PolicyType.returnPolicy,
            );
          },
          svgData: SvgData.documentDataLock,
          title: 'Return Policy',
        ),
      ],
    );
  }

  Future<dynamic> showCustomSheet({
    required BuildContext context,
    required PolicyDataSource dataSource,
    required PolicyType policyType,
  }) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
      ),
      builder: (context) {
        return SupportBottomSheet(
          dataSource: dataSource,
          policyType: policyType,
        );
      },
    );
  }
}
