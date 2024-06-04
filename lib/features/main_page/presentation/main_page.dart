import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/common/widgets/open_cart_button.dart';
import 'package:idnshop/features/main_page/presentation/main_page_partials/best_selling_section.dart';
import 'package:idnshop/features/main_page/presentation/main_page_partials/new_arrival_section.dart';
import 'package:idnshop/features/main_page/presentation/main_page_partials/our_collection_section.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/svg_data.dart';
import 'package:idnshop/features/main_page/presentation/main_page_partials/login_reminder.dart';
import 'package:idnshop/features/main_page/presentation/main_page_partials/main_carousel.dart';
import 'package:idnshop/common/widgets/footer.dart';
import 'package:idnshop/common/widgets/plane_indicator.dart';

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
          colorFilter: const ColorFilter.mode(
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
              colorFilter: const ColorFilter.mode(
                CustomColor.secondary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          OpenCartButton(),
          const SizedBox(width: 4)
        ],
      ),
      body: PlaneIndicator(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              LoginReminder(),
              MainCarousel(),
              OurCollectionSection(),
              BestSellingSection(),
              NewArrivalSection(),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
