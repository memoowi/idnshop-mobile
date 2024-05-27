import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/src/bloc/onboarding/onboarding_bloc.dart';
import 'package:idnshop/src/routes/app_routes.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardingData> items = OnBoardingData.items;
  int _backPressCount = 0;
  bool _canPop = false;
  Timer? _exitTimer;

  void _startExitTimer() {
    _exitTimer?.cancel(); // Cancel any existing timer
    _exitTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _backPressCount = 0; // Reset counter
        _canPop = false;
      });
    });
  }

  final carouselController = CarouselController();

  @override
  void dispose() {
    _exitTimer?.cancel(); // Cancel timer on widget disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingDone) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home, (Route<dynamic> route) => false);
        } else if (state is OnboardingGetStarted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.home, (Route<dynamic> route) => false);
          Navigator.of(context).pushNamed(AppRoutes.register);
        }
      },
      builder: (context, state) {
        int currentIndex = 0;
        if (state is OnboardingPageChanged) {
          currentIndex = state.currentIndex;
        }
        return PopScope(
          canPop: _canPop,
          onPopInvoked: (didPop) {
            if (!didPop) {
              if (currentIndex != 0) {
                context.read<OnboardingBloc>().add(PreviousPageEvent());
                carouselController.previousPage();
                return;
              }
              if (_backPressCount == 0) {
                Fluttertoast.showToast(
                  msg: "Press back again to exit",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.black54,
                );
              }
              _startExitTimer();
              setState(() {
                _backPressCount++;
                _canPop = true;
              });
            }
          },
          child: Scaffold(
            appBar: appBar(),
            extendBodyBehindAppBar: true,
            backgroundColor: CustomColor.primary,
            body: Column(
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    initialPage: currentIndex,
                    viewportFraction: 1.0,
                    height: MediaQuery.of(context).size.height * 0.6,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      context
                          .read<OnboardingBloc>()
                          .add(UpdatePageEvent(index));
                    },
                  ),
                  items: items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          item.image,
                        );
                      },
                    );
                  }).toList(),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          items[currentIndex].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          items[currentIndex].description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                for (int i = 0; i < items.length; i++)
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentIndex == i
                                          ? CustomColor.secondary1
                                          : Colors.grey,
                                    ),
                                  ),
                              ],
                            ),
                            FilledButton(
                              onPressed: () {
                                if (currentIndex < items.length - 1) {
                                  context
                                      .read<OnboardingBloc>()
                                      .add(NextPageEvent());
                                  carouselController.nextPage();
                                } else if (currentIndex == items.length - 1) {
                                  context
                                      .read<OnboardingBloc>()
                                      .add(GetStartedEvent());
                                }
                              },
                              child: Text(
                                currentIndex == items.length - 1
                                    ? 'Get Started'
                                    : 'Next',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      actions: [
        TextButton(
          onPressed: () {
            context.read<OnboardingBloc>().add(SkipEvent());
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text('Skip'),
        ),
      ],
    );
  }
}
