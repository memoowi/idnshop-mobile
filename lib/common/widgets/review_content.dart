import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/common/widgets/custom_rating_bar.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.border),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: CachedNetworkImageProvider(
                        "https://via.placeholder.com/64x64"),
                    fit: BoxFit.cover,
                  ),
                  color: CustomColor.lightGrey,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: CustomColor.border,
                    ),
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name User',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  const CustomRatingBar(rating: 4.5),
                  const SizedBox(height: 4),
                  Text(
                    DataFormatter.ddMMyyyy(DateTime.now()),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'This hat isn`t just for baseball fans; it`s a fantastic everyday essential. Whether you`re hitting the beach, running errands, or simply adding a touch of cool to your casual look, the [Hat Name] baseball hat delivers in both style and comfort. It`s a high-quality product at a great value, making it a true champion in my book!',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const CustomCachedNetworkImage(
                          imageUrl: 'https://via.placeholder.com/120x120',
                          fit: BoxFit.cover,
                          withErrorText: false,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(4),
                          color: CustomColor.secondary2,
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                CupertinoIcons.video_camera_solid,
                                color: Colors.white,
                              ),
                              Text(
                                '01:50',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    width: 120,
                    height: 120,
                    child: CustomCachedNetworkImage(
                      imageUrl: 'https://via.placeholder.com/120x120',
                      fit: BoxFit.cover,
                      withErrorText: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
