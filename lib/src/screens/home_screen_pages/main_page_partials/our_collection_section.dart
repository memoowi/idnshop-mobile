import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class OurCollectionSection extends StatelessWidget {
  const OurCollectionSection({
    super.key,
  });

  List<Map<String, dynamic>> get color => [
        {
          'bg-color': CustomColor.primary,
          'text-color': Colors.white,
        },
        {
          'bg-color': CustomColor.yellow,
          'text-color': CustomColor.secondary1,
        },
        {
          'bg-color': CustomColor.secondary1,
          'text-color': Colors.white,
        },
      ];

  List<Map<String, dynamic>> get items => [
        {
          'title': 'On Trend \u{1F680}',
          'description': 'A collection of current most popular products',
          'image': 'assets/images/chara-1.png',
        },
        {
          'title': 'Travel Essentials \u{26FA}',
          'description': 'Must have some essentials for traveling',
          'image': 'assets/images/chara-2.png',
        },
        {
          'title': 'Winter Collection \u{2744}',
          'description': 'Stay warm and stylish with our winter collection',
          'image': 'assets/images/chara-3.png',
        },
        {
          'title': 'Summer Collection \u{1F525}',
          'description': 'Stay stylish and stylish with our summer collection',
          'image': 'assets/images/chara-1.png',
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
            height: 300,
            child: ListView.separated(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final colorIndex = index % color.length;
                return InkWell(
                  onTap: () {},
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: color[colorIndex]['bg-color'],
                        image: DecorationImage(
                          image: AssetImage(items[index]['image']),
                          fit: BoxFit.none,
                          scale: 3.0,
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: color[colorIndex]['text-color'],
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            items[index]['description'],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: color[colorIndex]['text-color'],
                                ),
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
