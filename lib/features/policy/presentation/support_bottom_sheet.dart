import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:idnshop/common/widgets/footer.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:idnshop/features/policy/cubit/policy_cubit.dart';
import 'package:idnshop/features/policy/data/policy_type.dart';
import 'package:idnshop/features/policy/data/policy_data_source.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SupportBottomSheet extends StatelessWidget {
  final PolicyDataSource dataSource;
  final PolicyType policyType;
  const SupportBottomSheet({
    super.key,
    required this.dataSource,
    required this.policyType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PolicyCubit>(
      create: (context) =>
          PolicyCubit(dataSource)..loadPrivacyPolicy(policyType),
      child: BlocBuilder<PolicyCubit, String?>(
        builder: (context, state) {
          if (state == null) {
            return Center(
              child: Lottie.asset(
                LottieData.loadingSquare,
                width: 80,
              ),
            );
          } else {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: [
                HtmlWidget(
                  state,
                  customStylesBuilder: (element) {
                    if (element.localName == 'h1' ||
                        element.localName == 'h3') {
                      return {'font-family': CustomTextTheme.headingFontFamily};
                    }
                    return null;
                  },
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  onTapUrl: (p0) {
                    launchUrlString(p0);
                    return true;
                  },
                ),
                const Footer(),
              ],
            );
          }
        },
      ),
    );
  }
}
