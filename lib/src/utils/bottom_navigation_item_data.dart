import 'package:flutter/material.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/chat_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/collection_page.dart';
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
          screen: CollectionPage(),
          icon: SvgData.tag,
          activeIcon: SvgData.tagFill,
          label: "Collection",
        ),
        BottomNavigationItemData(
          screen: OrderPage(),
          icon: SvgData.documentText,
          activeIcon: SvgData.documentTextFill,
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
