import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class PreloadScreen extends StatelessWidget {
  const PreloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        forceMaterialTransparency: true,
      ),
      backgroundColor: CustomColor.primary,
      body: const Center(
        child: CircularProgressIndicator(
          color: CustomColor.secondary1,
        ),
      ),
    );
  }
}
