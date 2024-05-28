import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop by Category',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              ListView.separated(
                // scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                separatorBuilder: (context, index) => SizedBox(width: 10.0),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AspectRatio(
                    aspectRatio: 1 / 1.2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColor.accent1,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://i.ibb.co.com/8zzc9M0/sweater.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.bottomCenter,
                      child: Text('Category $index'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
