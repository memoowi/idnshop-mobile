import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: searchController,
      onSubmitted: (value) {
        log('query: $value');
      },
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Search products...',
        hintStyle: Theme.of(context).textTheme.labelLarge,
        prefixIcon: SvgPicture.asset(
          SvgData.search,
          colorFilter: const ColorFilter.mode(
            CustomColor.secondary1,
            BlendMode.srcIn,
          ),
          fit: BoxFit.none,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            searchController.clear();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          icon: SvgPicture.asset(
            SvgData.close,
            colorFilter: const ColorFilter.mode(
              CustomColor.secondary1,
              BlendMode.srcIn,
            ),
            width: 20,
            height: 20,
          ),
        ),
      ),
      textInputAction: TextInputAction.search,
    );
  }
}
