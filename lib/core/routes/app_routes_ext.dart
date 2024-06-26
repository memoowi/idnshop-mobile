part of 'app_routes.dart';

class AppRoutes {
  static const String preload = '/prelaod';
  static const String onBoarding = '/on-boarding';
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';

  // route on account page
  static const String editProfilePicture = '/edit-pp';
  static const String changePassword = '/change-password';
  static const String faq = '/faq';
  static const String privacySetting = '/privacy-setting';
  static const String address = '/address';

  static String initialRoute = preload;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case preload:
        return _fadeTransition(const PreloadScreen(), preload);
      case onBoarding:
        return _fadeTransition(const OnBoardingScreen(), onBoarding);
      case home:
        return _fadeTransition(HomeScreen(), home);
      case login:
        return _slideTransition(LoginScreen(), login, 1.0, 0.0);
      case register:
        return _slideTransition(RegisterScreen(), register, 1.0, 0.0);
      case editProfilePicture:
        return _slideTransition(
            EditProfilePictureScreen(), editProfilePicture, 0.0, -1.0);
      case changePassword:
        return _slideTransition(
            ChangePasswordScreen(), changePassword, 1.0, 0.0);
      case faq:
        return _slideTransition(FAQScreen(), faq, 0.0, 1.0);
      case privacySetting:
        return _slideTransition(
            PrivacySettingScreen(), privacySetting, 1.0, 0.0);
      case address:
        return _slideTransition(AddressScreen(), home, 1.0, 0.0);
      default:
        return _fadeTransition(HomeScreen(), home);
    }
  }

  static PageRouteBuilder _fadeTransition(Widget page, String name) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static PageRouteBuilder _slideTransition(
      Widget page, String name, double dx, double dy) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name),
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
