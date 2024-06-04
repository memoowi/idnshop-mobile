import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/features/account/presentation/update_profile/change_password_screen.dart';
import 'package:idnshop/features/account/presentation/update_profile/edit_profile_picture_screen.dart';
import 'package:idnshop/features/auth/presentation/register_screen.dart';
import 'package:idnshop/features/faq/presentation/faq_screen.dart';
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

  // route on account page
  static const String editProfilePicture = '/edit-pp';
  static const String changePassword = '/change-password';
  static const String faq = '/faq';

  static String initialRoute = preload;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case preload:
        return _fadeTransition(const PreloadScreen());
      case onBoarding:
        return _fadeTransition(const OnBoardingScreen());
      case home:
        return _fadeTransition(HomeScreen());
      case login:
        return _slideTransition(LoginScreen(), 1.0, 0.0);
      case register:
        return _slideTransition(RegisterScreen(), 1.0, 0.0);
      case editProfilePicture:
        return _slideTransition(EditProfilePictureScreen(), 0.0, -1.0);
      case changePassword:
        return _slideTransition(ChangePasswordScreen(), 1.0, 0.0);
      case faq:
        return _slideTransition(FAQScreen(), 0.0, 1.0);
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

  static PageRouteBuilder _slideTransition(Widget page, double dx, double dy) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final begin = Offset(dx, dy);
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
