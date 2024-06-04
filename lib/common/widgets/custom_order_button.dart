import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOrderButton extends StatelessWidget {
  final Function()? onPressed;
  final String svgData;
  final Color svgColor;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomOrderButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor = Colors.white,
    required this.svgData,
    this.svgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
      ),
      icon: SvgPicture.asset(
        svgData,
        colorFilter: ColorFilter.mode(
          svgColor,
          BlendMode.srcIn,
        ),
        width: 20,
      ),
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 50),
        backgroundColor: backgroundColor,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
