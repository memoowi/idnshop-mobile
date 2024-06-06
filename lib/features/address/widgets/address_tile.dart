import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/address/data/address_data.dart';

class AddressTile extends StatelessWidget {
  final AddressData data;
  final VoidCallback onTap;
  final VoidCallback onSetAsDefault;
  final VoidCallback onDelete;
  const AddressTile({
    super.key,
    required this.data,
    required this.onTap,
    required this.onSetAsDefault,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: Colors.white,
      selected: data.isDefault,
      selectedColor: CustomColor.secondary1,
      selectedTileColor: CustomColor.accent1,
      shape: Border.all(
        color: CustomColor.border,
        width: 1,
      ),
      contentPadding: const EdgeInsets.all(16),
      title: Text(data.name),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.phoneNumber,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data.address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            '${data.district}, ${data.city}, ${data.province}, ${data.country}, ${data.postalCode}'
                .toUpperCase(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            data.otherDetails,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: !data.isDefault ? onSetAsDefault : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 40),
                  backgroundColor: CustomColor.secondary1,
                  disabledBackgroundColor: CustomColor.orange,
                ),
                child: Text(
                  data.isDefault ? 'Default' : 'Set as default',
                ),
              ),
              const SizedBox(width: 8),
              !data.isDefault
                  ? FilledButton(
                      onPressed: onDelete,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(0, 40),
                        backgroundColor: CustomColor.red,
                      ),
                      child: const Text('Delete'),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
