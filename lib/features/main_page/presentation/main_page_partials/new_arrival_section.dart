import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/common/widgets/product_card.dart';

class NewArrivalSection extends StatelessWidget {
  const NewArrivalSection({
    super.key,
  });

  List<Map<String, dynamic>> get newArrivalProducts => [
        {
          'image': 'https://i.ibb.co.com/8zzc9M0/sweater.png',
          'title': 'Sweater',
          'rating': 4.5,
          'price': 50000,
          'sold': 3
        },
        {
          'image': 'https://i.ibb.co.com/3SpLWds/cap.png',
          'title': 'BaseballBaseball Love Cap',
          'rating': 5.0,
          'price': 25000,
          'sold': 1
        },
        {
          'image': 'https://i.ibb.co.com/VCYgdN1/shirt.png',
          'title': 'Shirt',
          'rating': 4.0,
          'price': 35000,
          'sold': 2
        },
        {
          'image': 'https://i.ibb.co.com/9gGdTjc/pants.png',
          'title': 'Pants',
          'rating': 3.0,
          'price': 60000,
          'sold': 4
        },
        {
          'image': 'https://i.ibb.co.com/xXY8VYv/shoes.png',
          'title': 'Shoes',
          'rating': 4.5,
          'price': 240000,
          'sold': 5
        },
        {
          'image': 'https://i.ibb.co.com/X4FyjqG/backpak.png',
          'title': 'Backpack',
          'rating': 4.8,
          'price': 450000,
          'sold': 6
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
                'New Arrivals'.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 5.3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: newArrivalProducts.length,
            itemBuilder: (context, index) {
              return ProductCard(
                onTap: () {},
                product: newArrivalProducts[index],
              );
            },
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('See More Fresh Arrivals'),
          ),
        ],
      ),
    );
  }
}
