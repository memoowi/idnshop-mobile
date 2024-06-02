import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/custom_color.dart';

class StatusFilter extends StatelessWidget {
  const StatusFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          CloseButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: WidgetStateProperty.all(Size(40, 40)),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: Size(0, 40),
              padding: EdgeInsets.symmetric(horizontal: 16),
              // backgroundColor: null,
              backgroundColor: CustomColor.accent1,
            ),
            child: Row(
              children: [
                Text(
                  // 'All',
                  'Status : Pending',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 20,
                  color: CustomColor.secondary1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
