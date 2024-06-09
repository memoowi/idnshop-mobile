import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/product_details/presentation/partials/more_product_section.dart';
import 'package:idnshop/features/product_details/presentation/partials/product_carousel.dart';
import 'package:idnshop/features/product_details/presentation/partials/product_description_section.dart';
import 'package:idnshop/features/product_details/presentation/partials/product_head_section.dart';
import 'package:idnshop/features/product_details/presentation/partials/reviews_section.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Name'),
        actions: [
          const OpenCartButton(),
          const SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductCarousel(),
            const ProductHeadSection(),
            const Divider(),
            const ProductDescriptionSection(),
            const Divider(),
            const ReviewsSection(),
            const SizedBox(height: 8),
            MoreProductSection()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: CustomColor.border,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'Coming Soon',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    backgroundColor: CustomColor.red,
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: CustomColor.green,
                ),
                icon: SvgPicture.asset(
                  SvgData.chatDots,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                ),
                label: Text('Chat'.toUpperCase()),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FilledButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    constraints: const BoxConstraints(
                      minWidth: double.infinity,
                    ),
                    showDragHandle: true,
                    useSafeArea: true,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add to cart'.toUpperCase(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Color: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: 'Black',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: [
                                ...List.generate(
                                  3,
                                  (index) => ChoiceChip(
                                    onSelected: (value) {},
                                    selected: false,
                                    label: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: CustomColor.accent2,
                                          radius: 10,
                                        ),
                                        SizedBox(width: 8),
                                        Text('Color Name'),
                                      ],
                                    ),
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    showCheckmark: false,
                                    backgroundColor: Colors.white,
                                    selectedColor: CustomColor.accent1,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                        color: CustomColor.border,
                                      ),
                                    ),
                                  ),
                                ),
                                ChoiceChip(
                                  onSelected: (value) {},
                                  selected: true,
                                  label: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: CustomColor.accent2,
                                        radius: 10,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Color Name'),
                                    ],
                                  ),
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  showCheckmark: false,
                                  backgroundColor: Colors.white,
                                  selectedColor: CustomColor.accent1,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(
                                      color: CustomColor.border,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Size',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 4,
                              runSpacing: 4,
                              children: [
                                ...List.generate(
                                  3,
                                  (index) => ChoiceChip(
                                    onSelected: (value) {},
                                    selected: false,
                                    label: const Text('S'),
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyMedium,
                                    showCheckmark: false,
                                    backgroundColor: Colors.white,
                                    selectedColor: CustomColor.accent1,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                        color: CustomColor.border,
                                      ),
                                    ),
                                  ),
                                ),
                                ChoiceChip(
                                  onSelected: (value) {},
                                  selected: true,
                                  label: const Text('S'),
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyMedium,
                                  showCheckmark: false,
                                  backgroundColor: Colors.white,
                                  selectedColor: CustomColor.accent1,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(
                                      color: CustomColor.border,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            FilledButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Fluttertoast.showToast(
                                  msg: 'Added to cart',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  backgroundColor: Colors.green,
                                );
                              },
                              style: FilledButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              icon: SvgPicture.asset(
                                SvgData.bag,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                                height: 20,
                              ),
                              label: Text('Add to cart'.toUpperCase()),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: SvgPicture.asset(
                  SvgData.bag,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  height: 20,
                ),
                label: Text('Cart'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
