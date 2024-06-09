import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Shirt',
      'image': 'https://i.ibb.co.com/VCYgdN1/shirt.png',
    },
    {
      'title': 'Pants',
      'image': 'https://i.ibb.co.com/9gGdTjc/pants.png',
    },
    {
      'title': 'Sweater',
      'image': 'https://i.ibb.co.com/8zzc9M0/sweater.png',
    },
    {
      'title': 'Cap',
      'image': 'https://i.ibb.co.com/3SpLWds/cap.png',
    },
    {
      'title': 'Shoes',
      'image': 'https://i.ibb.co.com/xXY8VYv/shoes.png',
    },
    {
      'title': 'Backpack',
      'image': 'https://i.ibb.co.com/X4FyjqG/backpak.png',
    },
    {
      'title': 'Sunglasses',
      'image': 'https://i.ibb.co.com/RjWN7dq/sunglasess.png',
    },
    {
      'title': 'Umbrella',
      'image': 'https://i.ibb.co.com/cxX73Rf/umbrella.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop By Category'),
        automaticallyImplyLeading: false,
        actions: const [OpenCartButton(), SizedBox(width: 4)],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1 / 1.35,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: CustomColor.lightGrey,
                    child: CustomCachedNetworkImage(
                      imageUrl: categories[index]['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  categories[index]['title'],
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
