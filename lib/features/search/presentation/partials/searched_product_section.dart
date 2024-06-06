import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/custom_radio.dart';
import 'package:idnshop/common/widgets/product_card.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/main_page/data/product_data.dart';

class SearchedProductSection extends StatelessWidget {
  SearchedProductSection({
    super.key,
  });

  final List productData = ProductData.products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Showing results for "shoes"',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            IconButton.outlined(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  useRootNavigator: true,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  backgroundColor: Colors.white,
                  constraints: BoxConstraints(
                    minWidth: double.infinity,
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ExpansionTile(
                                    initiallyExpanded: true,
                                    shape: const Border(
                                      bottom: BorderSide(
                                        color: CustomColor.border,
                                      ),
                                    ),
                                    title: Text(
                                      'Sort by',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    children: [
                                      CustomRadio(
                                        title: 'Relevance',
                                        value: 0,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                      CustomRadio(
                                        title: 'Latest',
                                        value: 3,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                      CustomRadio(
                                        title: 'Top sales',
                                        value: 4,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                      CustomRadio(
                                        title: 'Price: low to high',
                                        value: 1,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                      CustomRadio(
                                        title: 'Price: high to low',
                                        value: 2,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                  ExpansionTile(
                                    shape: const Border(
                                      bottom: BorderSide(
                                        color: CustomColor.border,
                                      ),
                                    ),
                                    title: Text(
                                      'Category',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                    children: [
                                      CustomRadio(
                                        title: 'Clothing',
                                        value: 0,
                                        groupValue: 0,
                                        onChanged: (value) {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Clear'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: FilledButton.styleFrom(
                                      backgroundColor: CustomColor.secondary1),
                                  child: const Text('Apply'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              style: IconButton.styleFrom(
                minimumSize: const Size(0, 0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                side: const BorderSide(
                  color: CustomColor.secondary1,
                ),
              ),
              icon: const Icon(
                CupertinoIcons.slider_horizontal_3,
                color: CustomColor.secondary1,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 5.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: productData.length,
          itemBuilder: (context, index) {
            return ProductCard(
              onTap: () {},
              product: productData[index],
              showStars: true,
            );
          },
        ),
      ],
    );
  }
}
