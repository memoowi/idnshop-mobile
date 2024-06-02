import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:lottie/lottie.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.withErrorText = true,
  });

  final String imageUrl;
  final BoxFit? fit;
  final bool withErrorText;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) {
        return Center(
          child: Lottie.asset(
            'assets/lottie/loading-image.json',
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: withErrorText
                ? [
                    Icon(
                      CupertinoIcons.exclamationmark_square,
                      color: CustomColor.secondary1,
                      size: 24,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Failed to load image',
                    ),
                  ]
                : [
                    Icon(
                      CupertinoIcons.exclamationmark_triangle,
                      color: CustomColor.secondary1,
                      size: 24,
                    ),
                  ],
          ),
        );
      },
    );
  }
}
