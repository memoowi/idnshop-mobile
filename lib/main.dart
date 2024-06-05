import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/routes/route_observer.dart';
import 'package:idnshop/core/theme/custom_app_bar_theme.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_filled_button_theme.dart';
import 'package:idnshop/core/theme/custom_input_decoration_theme.dart';
import 'package:idnshop/core/theme/custom_outlined_button_theme.dart';
import 'package:idnshop/core/theme/custom_text_button_theme.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';
import 'package:idnshop/core/secrets/config.dart';
import 'package:idnshop/features/account/bloc/profile_pciture_cubit.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfilePictureCubit>(
          create: (context) => ProfilePictureCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final RouteObserverService routeObserver = RouteObserverService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColor.primary,
          primary: CustomColor.primary,
          onError: CustomColor.red,
          outline: CustomColor.border,
        ),
        appBarTheme: CustomAppBarTheme.defaultTheme,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: CustomTextTheme.baseFontFamily,
        textTheme: CustomTextTheme.defaultTheme,
        inputDecorationTheme: CustomInputDecorationTheme.defaultTheme,
        // buttons
        textButtonTheme: CustomTextButtonTheme.defaultTheme,
        filledButtonTheme: CustomFilledButtonTheme.defaultTheme,
        outlinedButtonTheme: CustomOutlinedButtonTheme.defaultTheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: Config.debug,
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      navigatorObservers: [routeObserver],
    );
  }
}
