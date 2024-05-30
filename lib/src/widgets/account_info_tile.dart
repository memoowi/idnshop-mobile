import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class AccountInfoTile extends StatelessWidget {
  final Function()? onTap;
  final String leading;
  final String title;
  final IconData icon;

  const AccountInfoTile({
    super.key,
    this.onTap,
    required this.leading,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minTileHeight: 0,
      minLeadingWidth: 120,
      titleAlignment: ListTileTitleAlignment.top,
      leading: Text(
        leading,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Icon(
        icon,
        color: CustomColor.secondary1,
        size: 20,
      ),
    );
  }
}
