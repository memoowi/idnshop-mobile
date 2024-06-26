import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idnshop/features/app_start/cubit/app_start_cubit.dart';
import 'package:idnshop/core/routes/app_routes.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/core/theme/custom_text_theme.dart';
import 'package:idnshop/core/secrets/config.dart';

class PreloadScreen extends StatelessWidget {
  const PreloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        forceMaterialTransparency: true,
      ),
      backgroundColor: CustomColor.primary,
      body: BlocProvider(
        create: (context) => AppStartCubit()..appStartCheck(),
        child: BlocListener<AppStartCubit, AppStartState>(
          listener: (context, state) {
            if (state is ToHome) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              Future.delayed(const Duration(seconds: 1), () {
                FlutterNativeSplash.remove();
              });
            } else if (state is ToOnBoarding) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.onBoarding);
              FlutterNativeSplash.remove();
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 240,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/idn-logo-light.png',
                      width: 44,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      Config.appName,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: CustomTextTheme.brandFontFamily,
                              ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                SpinKitWave(
                  size: 30,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
