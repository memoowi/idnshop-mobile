import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/common/widgets/custom_cached_network_image.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({
    super.key,
  });

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  final CarouselController _controller = CarouselController();
  List<String> imgUrl = [
    'https://i.ibb.co.com/9gGdTjc/pants.png',
    'https://i.ibb.co.com/8zzc9M0/sweater.png',
    'https://i.ibb.co.com/RjWN7dq/sunglasess.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          color: CustomColor.accent1,
          child: CarouselSlider(
            carouselController: _controller,
            items: [
              ...List.generate(
                imgUrl.length,
                (index) => InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 3.0,
                          child: CustomCachedNetworkImage(
                            imageUrl: imgUrl[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    );
                  },
                  child: CustomCachedNetworkImage(
                    imageUrl: imgUrl[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              aspectRatio: 3 / 4,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: imgUrl.length,
            effect: ScaleEffect(
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
