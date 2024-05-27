import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/src/routes/app_routes.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',
            hintStyle: Theme.of(context).textTheme.labelLarge,
            prefixIcon: Icon(CupertinoIcons.search),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.border),
              borderRadius: BorderRadius.zero,
            ),
            isDense: true,
          ),
          readOnly: true,
          canRequestFocus: false,
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.search);
            // Navigator.of(context, rootNavigator: true)
            //     .pushNamed(AppRoutes.search);
          },
        ),
      ),
      body: Container(),
    );
  }
}
