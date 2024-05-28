import 'package:flutter/material.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/chat_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/category_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/order_page.dart';
import 'package:idnshop/src/utils/svg_data.dart';

class BottomNavigationItemData {
  final Widget screen;
  final String icon;
  final String activeIcon;
  final String label;
  const BottomNavigationItemData({
    required this.screen,
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  static List<BottomNavigationItemData> get items => [
        BottomNavigationItemData(
          screen: MainPage(),
          icon: SvgData.home,
          activeIcon: SvgData.homeFill,
          label: "Home",
        ),
        BottomNavigationItemData(
          screen: CategoryPage(),
          icon: SvgData.widget2Linear,
          activeIcon: SvgData.widget2Filled,
          label: "Category",
        ),
        BottomNavigationItemData(
          screen: OrderPage(),
          icon: SvgData.billListLinear,
          activeIcon: SvgData.billListFilled,
          label: "Order",
        ),
        BottomNavigationItemData(
          screen: ChatPage(),
          icon: SvgData.chat,
          activeIcon: SvgData.chatFill,
          label: "Chat",
        ),
        BottomNavigationItemData(
          screen: AccountPage(),
          icon: SvgData.user,
          activeIcon: SvgData.userFill,
          label: "Account",
        ),
      ];
}
