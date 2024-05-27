import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:idnshop/src/bloc/onboarding/onboarding_bloc.dart';
import 'package:idnshop/src/routes/app_routes.dart';
import 'package:idnshop/src/theme/custom_app_bar_theme.dart';
import 'package:idnshop/src/theme/custom_color.dart';
import 'package:idnshop/src/theme/custom_filled_button_theme.dart';
import 'package:idnshop/src/theme/custom_text_button_theme.dart';
import 'package:idnshop/src/theme/custom_text_theme.dart';
import 'package:idnshop/src/utils/config.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (context) => OnboardingBloc()..add(CheckEvent()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: CustomColor.primary),
        appBarTheme: CustomAppBarTheme.customAppBarTheme,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: CustomTextTheme.baseFontFamily,
        textTheme: CustomTextTheme.customTextTheme,
        textButtonTheme: CustomTextButtonTheme.customTextButtonTheme,
        filledButtonTheme: CustomFilledButtonTheme.customFilledButtonTheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: Config.debug,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
