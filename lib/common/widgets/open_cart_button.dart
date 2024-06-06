import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class OpenCartButton extends StatelessWidget {
  const OpenCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.cart);
      },
      icon: SvgPicture.asset(
        SvgData.bag,
        colorFilter: const ColorFilter.mode(
          CustomColor.secondary1,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
