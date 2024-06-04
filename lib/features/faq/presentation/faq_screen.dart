import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnshop/common/widgets/footer.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/lottie_data.dart';
import 'package:idnshop/features/faq/cubit/faq_cubit.dart';
import 'package:idnshop/features/faq/data/faq_data.dart';
import 'package:lottie/lottie.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaqCubit>(
      create: (context) => FaqCubit()..loadFaq(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FAQ'),
        ),
        body: BlocBuilder<FaqCubit, List<FAQData>?>(
          builder: (context, state) {
            if (state == null) {
              return Center(
                child: Lottie.asset(
                  LottieData.loadingSquare,
                  width: 80,
                ),
              );
            } else {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Need Help?',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Frequently Asked Questions'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: CustomColor.primary),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(
                    state.length,
                    (index) {
                      return ExpansionTile(
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        childrenPadding:
                            const EdgeInsets.fromLTRB(16, 4, 16, 16),
                        shape: const Border(
                          bottom: BorderSide(
                            color: CustomColor.accent1,
                          ),
                        ),
                        collapsedShape: const Border(
                          bottom: BorderSide(
                            color: CustomColor.accent1,
                          ),
                        ),
                        title: Text(
                          state[index].question,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state[index].answer,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  const Footer(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
