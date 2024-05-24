import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idnshop/src/bloc/onboarding_bloc.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class OnBoarding1Screen extends StatefulWidget {
  const OnBoarding1Screen({super.key});

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
  int _backPressCount = 0;
  bool _canPop = false;
  Timer? _exitTimer;
  int _currentIndex = 0;

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
  void _onItemChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Map<String, dynamic>> onBoardingData = [
    {
      "image": "assets/images/chara-1.png",
      "title": "Shop Now",
      "description":
          "Discover the latest fashion trends and find the perfect pair for your style.",
    },
    {
      "image": "assets/images/chara-2.png",
      "title": "Fast Delivery",
      "description":
          "Get your favorite items at your doorsteps with our fast and reliable delivery service.",
    },
    {
      "image": "assets/images/chara-3.png",
      "title": "Easy Returns",
      "description":
          "Return your items in as little as 30 days with our hassle-free returns policy.",
    },
  ];

  @override
  void dispose() {
    _exitTimer?.cancel(); // Cancel timer on widget disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        return PopScope(
          canPop: _canPop,
          onPopInvoked: (didPop) {
            if (!didPop) {
              if (_currentIndex != 0) {
                carouselController.previousPage();
                setState(() {
                  _currentIndex = _currentIndex - 1;
                });
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
                    initialPage: _currentIndex,
                    viewportFraction: 1.0,
                    height: MediaQuery.of(context).size.height * 0.6,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      _onItemChanged(index);
                    },
                  ),
                  items: onBoardingData.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          item['image'],
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
                          onBoardingData[_currentIndex]['title'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          onBoardingData[_currentIndex]['description'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                for (int i = 0; i < onBoardingData.length; i++)
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _currentIndex == i
                                          ? CustomColor.secondary1
                                          : Colors.grey,
                                    ),
                                  ),
                              ],
                            ),
                            FilledButton(
                              onPressed: () {
                                if (_currentIndex < onBoardingData.length - 1) {
                                  _onItemChanged(_currentIndex + 1);
                                  carouselController.nextPage();
                                }
                              },
                              child: Text('Next'),
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
      backgroundColor: Colors.transparent,
      actions: [
        TextButton(
          onPressed: () {},
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
