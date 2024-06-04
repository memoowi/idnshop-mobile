import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/home_screen/data/bottom_navigation_item_data.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarOverlap: const NavBarOverlap.none(),
      tabs: BottomNavigationItemData.items
          .map((item) => buildTab(
                screen: item.screen,
                title: item.label,
                svgIconInactive: item.icon,
                svgIconActive: item.activeIcon,
              ))
          .toList(),
      navBarHeight: 64,
      navBarBuilder: (navBarConfig) => Style10BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              color: CustomColor.border,
            )
          ],
        ),
      ),
    );
  }

  PersistentTabConfig buildTab({
    required Widget screen,
    required String title,
    required String svgIconInactive,
    required String svgIconActive,
  }) {
    return PersistentTabConfig(
      screen: screen,
      item: ItemConfig(
        icon: SvgPicture.asset(
          svgIconActive,
          colorFilter: const ColorFilter.mode(
            CustomColor.primary,
            BlendMode.srcIn,
          ),
        ),
        activeForegroundColor: CustomColor.primary,
        inactiveForegroundColor: CustomColor.secondary1,
        inactiveIcon: SvgPicture.asset(
          svgIconInactive,
          colorFilter: const ColorFilter.mode(
            CustomColor.secondary1,
            BlendMode.srcIn,
          ),
        ),
        title: title,
      ),
    );
  }
}
