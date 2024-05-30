import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/best_selling_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/new_arrival_section.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/our_collection_section.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/svg_data.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/login_reminder.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page_partials/main_carousel.dart';
import 'package:idnshop/src/widgets/footer.dart';

class MainPage extends StatelessWidget {
  MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: SvgPicture.asset(
          SvgData.idnshopDark,
          colorFilter: ColorFilter.mode(
            CustomColor.secondary1,
            BlendMode.srcIn,
          ),
          height: 36,
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
            Footer()
          ],
        ),
      ),
    );
  }
}
