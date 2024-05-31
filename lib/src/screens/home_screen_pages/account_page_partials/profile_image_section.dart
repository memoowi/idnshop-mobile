import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
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
            top: -4,
            right: -4,
            child: IconButton.filled(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  clipBehavior: Clip.hardEdge,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: Row(
                            children: [
                              Text(
                                'Edit Profile Image',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading: const Icon(CupertinoIcons.camera),
                          iconColor: CustomColor.primary,
                          title: Text(
                            'Take a picture',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          leading:
                              const Icon(CupertinoIcons.photo_on_rectangle),
                          iconColor: CustomColor.primary,
                          title: Text(
                            'Choose from gallery',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(CupertinoIcons.cursor_rays),
              iconSize: 18,
              constraints: const BoxConstraints(),
              tooltip: 'Edit Profile Image',
            ),
          ),
        ],
      ),
    );
  }
}
