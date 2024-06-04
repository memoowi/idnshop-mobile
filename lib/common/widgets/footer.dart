import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Footer extends StatefulWidget {
  const Footer({
    super.key,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  Future<String> _getInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

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
          const SizedBox(height: 4),
          FutureBuilder(
            future: _getInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'v${snapshot.data!}',
                  style: Theme.of(context).textTheme.labelMedium,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
