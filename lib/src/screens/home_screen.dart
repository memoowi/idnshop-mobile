import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/src/screens/home_screen_pages/account_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/chat_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/collection_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/main_page.dart';
import 'package:idnshop/src/screens/home_screen_pages/order_page.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: MainPage(),
          item: ItemConfig(
            icon: Icon(CupertinoIcons.hand_thumbsup_fill),
            inactiveIcon: Icon(CupertinoIcons.home),
            activeForegroundColor: CustomColor.primary,
            inactiveForegroundColor: CustomColor.secondary1,
            title: "Home",
            iconSize: 24,
          ),
        ),
        PersistentTabConfig(
          screen: CollectionPage(),
          item: ItemConfig(
            icon: Icon(Icons.settings),
            title: "Collection",
          ),
        ),
        PersistentTabConfig(
          screen: OrderPage(),
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart),
            title: "Order",
          ),
        ),
        PersistentTabConfig(
          screen: ChatPage(),
          item: ItemConfig(
            icon: Icon(Icons.chat),
            title: "Chat",
          ),
        ),
        PersistentTabConfig(
          screen: AccountPage(),
          item: ItemConfig(
            icon: Icon(
              IconData(0xe902, fontFamily: 'Custom Font Icon'),
            ),
            title: "Account",
          ),
        ),
      ],
      navBarHeight: 64,
      navBarBuilder: (navBarConfig) => Style10BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
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
}
