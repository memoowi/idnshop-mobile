import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/src/widgets/custom_cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainCarousel extends StatefulWidget {
  const MainCarousel({super.key});

  @override
  State<MainCarousel> createState() => _MainCarouselState();
}

class _MainCarouselState extends State<MainCarousel> {
  late CarouselController carouselController;

  int _activeIndex = 0;

  List<String> get images => [
        'https://i.ibb.co.com/7NCB8Qw/carousel-1.png',
        'https://i.ibb.co.com/5BkjPdz/carousel-2.png',
        'https://i.ibb.co.com/YWpkgwf/carousel-3.png',
      ];

  @override
  void initState() {
    super.initState();
    carouselController = CarouselController();
  }

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
                child: CustomCachedNetworkImage(
                  imageUrl: images[index],
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
              expansionFactor: 4,
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
