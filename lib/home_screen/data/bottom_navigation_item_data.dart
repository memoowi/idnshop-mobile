import 'package:flutter/material.dart';
import 'package:idnshop/features/account/presentation/account_page.dart';
import 'package:idnshop/features/chat/presentation/chat_page.dart';
import 'package:idnshop/features/category/presentation/category_page.dart';
import 'package:idnshop/features/main_page/presentation/main_page.dart';
import 'package:idnshop/features/order_list/presentation/order_page.dart';
import 'package:idnshop/core/theme/svg_data.dart';

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
