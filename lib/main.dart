import 'package:flutter/material.dart';
import 'package:idnshop/src/routes/app_routes.dart';
import 'package:idnshop/src/screens/auth/login_screen.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.primary),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(color: CustomColor.secondary1),
          headlineMedium: TextStyle(color: CustomColor.secondary1),
          headlineSmall: TextStyle(color: CustomColor.secondary1),
          bodyLarge: TextStyle(color: CustomColor.secondary1),
          bodyMedium: TextStyle(color: CustomColor.secondary1),
          bodySmall: TextStyle(color: CustomColor.secondary1),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: Config.debug,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
