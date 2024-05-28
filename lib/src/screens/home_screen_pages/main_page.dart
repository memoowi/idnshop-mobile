import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/best_selling_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/new_arrival_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/our_collection_section.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/theme/custom_text_theme.dart';
import 'package:idnshop/src/utils/config.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/login_reminder.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/main_carousel.dart';

class MainPage extends StatelessWidget {
  MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/idn-logo-dark.png',
              height: 32,
            ),
            const SizedBox(width: 4),
            Text(
              Config.appName,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: CustomTextTheme.brandFontFamily,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgData.search,
              colorFilter: ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgData.bag,
              colorFilter: ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 4)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginReminder(),
            MainCarousel(),
            OurCollectionSection(),
            BestSellingSection(),
            NewArrivalSection(),
          ],
        ),
      ),
    );
  }
}
