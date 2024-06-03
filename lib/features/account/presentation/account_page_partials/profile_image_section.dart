import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(AppRoutes.editProfilePicture);
        },
        child: const Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: CustomColor.accent1,
              // child: SvgPicture.asset(
              //   SvgData.userFill,
              //   colorFilter: const ColorFilter.mode(
              //     CustomColor.primary,
              //     BlendMode.srcIn,
              //   ),
              //   width: 64,
              //   height: 64,
              // ),
              foregroundImage: CachedNetworkImageProvider(
                'https://i.ibb.co.com/VHcWrL7/download.jpg',
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: CustomColor.primary,
                foregroundColor: Colors.white,
                child: Icon(
                  CupertinoIcons.cursor_rays,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
