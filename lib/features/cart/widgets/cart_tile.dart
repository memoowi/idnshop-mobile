import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/utils/data_formatter.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/cart/widgets/delete_cart_dialog.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: true,
      onChanged: (value) {},
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: CustomColor.primary,
      shape: Border.all(
        color: CustomColor.border,
      ),
      visualDensity: VisualDensity.compact,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            color: CustomColor.accent1,
            child: CustomCachedNetworkImage(
              imageUrl: 'https://i.ibb.co.com/cxX73Rf/umbrella.png',
              fit: BoxFit.contain,
              withErrorText: true,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Umbrella'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DataFormatter.formatCurrency(1000000),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: CustomColor.primary,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Categoriy / Collection',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: CustomColor.orange,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Color Name'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Size : Small',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(30, 30),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Icon(Icons.remove, size: 20),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '1',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 4),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(30, 30),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Icon(Icons.add, size: 20),
                    ),
                    const Spacer(),
                    OutlinedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => DeleteCartDialog());
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(30, 30),
                        padding: EdgeInsets.zero,
                      ),
                      child: SvgPicture.asset(
                        SvgData.trashBin,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          CustomColor.secondary1,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
