import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/widgets/review_content.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      hint: const Text('Filter'),
                      value: '',
                      style: Theme.of(context).textTheme.bodyMedium,
                      dropdownColor: Colors.white,
                      icon: SvgPicture.asset(
                        SvgData.filterRight,
                        colorFilter: const ColorFilter.mode(
                          CustomColor.secondary1,
                          BlendMode.srcIn,
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          enabled: false,
                          child: Text('Filter'),
                        ),
                        DropdownMenuItem(
                          value: '5 star',
                          child: Text('5 star'),
                        ),
                        DropdownMenuItem(
                          value: '4 star',
                          child: Text('4 star'),
                        ),
                        DropdownMenuItem(
                          value: '3 star',
                          child: Text('3 star'),
                        ),
                        DropdownMenuItem(
                          value: '2 star',
                          child: Text('2 star'),
                        ),
                        DropdownMenuItem(
                          value: '1 star',
                          child: Text('1 star'),
                        ),
                        DropdownMenuItem(
                          value: 'With Media',
                          child: Text('With Media'),
                        ),
                      ],
                      onChanged: (value) {
                        // Do something
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField(
                      hint: const Text('Sort by'),
                      value: 'High to Low',
                      style: Theme.of(context).textTheme.bodyMedium,
                      dropdownColor: Colors.white,
                      items: const [
                        DropdownMenuItem(
                          value: 'High to Low',
                          child: Text('High to Low'),
                        ),
                        DropdownMenuItem(
                          value: 'Low to High',
                          child: Text('Low to High'),
                        ),
                        DropdownMenuItem(
                          value: 'Newest',
                          child: Text('Newest'),
                        ),
                      ],
                      onChanged: (value) {
                        // Do something
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (context, index) => const ReviewContent(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
