import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/common/widgets/fetch_more_action.dart';
import 'package:idnshop/features/search/presentation/partials/recommendation_section.dart';
import 'package:idnshop/features/search/presentation/partials/search_field.dart';
import 'package:idnshop/features/search/presentation/partials/search_not_found.dart';
import 'package:idnshop/features/search/presentation/partials/searched_product_section.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchField(),
        actions: [
          OpenCartButton(),
          const SizedBox(width: 4),
        ],
      ),
      body: FetchMoreIndicator(
        onAction: () {},
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // FOR RECOMMENDATION
            // child: RecommendationSection(),

            // FOR NOT FOUND
            //  child:  SearchNotFound(),

            // FOR SEARCHED PRODUCT
            child: SearchedProductSection(),
          ),
        ),
      ),
    );
  }
}
