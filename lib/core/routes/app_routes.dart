import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/features/account/presentation/update_profile/edit_profile_picture_screen.dart';
import 'package:idnshop/features/auth/presentation/register_screen.dart';
import 'package:idnshop/home_screen/presentation/home_screen.dart';
import 'package:idnshop/features/auth/presentation/login_screen.dart';
import 'package:idnshop/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:idnshop/features/app_start/presentation/preload_screen.dart';

class AppRoutes {
  static const String preload = '/prelaod';
  static const String onBoarding = '/on-boarding';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static const String editProfilePicture = '/edit-pp';

  static String initialRoute = preload;
  // static String initialRoute = onBoarding;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case preload:
        return _fadeTransition(const PreloadScreen());
      case onBoarding:
        return _fadeTransition(const OnBoardingScreen());
      case home:
        return _fadeTransition(HomeScreen());
      case login:
        return _slideTransition(LoginScreen());
      case register:
        return _slideTransition(RegisterScreen());
      case editProfilePicture:
        return _slideTransition(EditProfilePictureScreen());
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
