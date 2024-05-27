import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key});

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  CarouselController carouselController = CarouselController();

  int _activeIndex = 0;

  List<String> images = [
    'assets/images/carousel-1.png',
    'assets/images/carousel-2.png',
    'assets/images/carousel-3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: [
            ...List.generate(
              images.length,
              (index) => InkWell(
                onTap: () {},
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _activeIndex = index;
              });
            },
            aspectRatio: 2.5 / 1,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
          ),
        ),
        Positioned(
          bottom: 8,
          child: AnimatedSmoothIndicator(
            activeIndex: _activeIndex,
            count: images.length,
            onDotClicked: (index) {
              carouselController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            effect: ExpandingDotsEffect(
              dotWidth: 8,
              dotHeight: 8,
              spacing: 4,
              dotColor: Colors.white.withOpacity(0.5),
              activeDotColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
