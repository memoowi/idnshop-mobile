import 'package:flutter/material.dart';
import 'package:idnshop/src/screens/auth/register_screen.dart';
import 'package:idnshop/src/screens/home_screen.dart';
import 'package:idnshop/src/screens/auth/login_screen.dart';

class AppRoutes {
  static const String onBoarding = '/on-boarding';

  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static String initialRoute = login;

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    login: (context) => LoginScreen(),
    register: (context) => RegisterScreen(),
  };
}
