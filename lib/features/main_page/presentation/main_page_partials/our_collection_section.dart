import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class OurCollectionSection extends StatelessWidget {
  const OurCollectionSection({
    super.key,
  });

  List<Map<String, dynamic>> get items => [
        {
          'title': 'On Trend \u{1F680}',
          'description': 'A collection of current most popular products',
          'image': 'https://i.ibb.co.com/pvGdfS8/collection-dummy-2.png',
        },
        {
          'title': 'Travel Essentials \u{26FA}',
          'description': 'Must have some essentials for traveling',
          'image': 'https://i.ibb.co.com/j5yRT0m/collection-dummy-3.png',
        },
        {
          'title': 'Winter Collection \u{2744}',
          'description': 'Stay warm and stylish with our winter collection',
          'image': 'https://i.ibb.co.com/N1wD4DD/collection-dummy.png',
        },
        {
          'title': 'Summer Collection \u{1F525}',
          'description': 'Stay stylish and stylish with our summer collection',
          'image': 'https://i.ibb.co.com/sjXVtPq/collection-dummy-1.png',
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                SvgData.printHash,
                colorFilter: ColorFilter.mode(
                  CustomColor.primary,
                  BlendMode.srcIn,
                ),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Our Collection'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 240,
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: CustomColor.lightGrey,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            items[index]['image'],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]['title'],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            items[index]['description'],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
