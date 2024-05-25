import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/src/screens/auth/register_screen.dart';
import 'package:idnshop/src/screens/home_screen.dart';
import 'package:idnshop/src/screens/auth/login_screen.dart';
import 'package:idnshop/src/screens/on_boarding/on_boarding_screen.dart';
import 'package:idnshop/src/screens/search_screen.dart';

class AppRoutes {
  static const String onBoarding = '/on-boarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String search = '/search';

  static String initialRoute = onBoarding;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return _fadeTransition(OnBoardingScreen());
      case home:
        return _fadeTransition(HomeScreen());
      case login:
        return _fadeTransition(LoginScreen());
      case register:
        return _fadeTransition(RegisterScreen());
      case search:
        return _slideTransition(SearchScreen());
      default:
        return _fadeTransition(HomeScreen());
    }
  }

  static PageRouteBuilder _fadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _slideTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
