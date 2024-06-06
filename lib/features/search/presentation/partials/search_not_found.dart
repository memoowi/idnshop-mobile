import 'package:flutter/material.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:idnshop/features/search/presentation/partials/recommendation_section.dart';
import 'package:lottie/lottie.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          LottieData.fileNotFound,
          width: 200,
        ),
        const SizedBox(height: 16),
        Text(
          'Sorry, we couldn’t find any matching results for this search.These products might interest you.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        RecommendationSection(),
      ],
    );
  }
}
