import 'dart:async';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:idnshop/src/theme/custom_color.dart';

class OnBoarding1Screen extends StatefulWidget {
  const OnBoarding1Screen({super.key});

  @override
  State<OnBoarding1Screen> createState() => _OnBoarding1ScreenState();
}

class _OnBoarding1ScreenState extends State<OnBoarding1Screen> {
  int _backPressCount = 0;
  bool _canPop = false;
  Timer? _exitTimer;

  void _startExitTimer() {
    _exitTimer?.cancel(); // Cancel any existing timer
    _exitTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _backPressCount = 0; // Reset counter
        _canPop = false;
      });
    });
  }

  @override
  void dispose() {
    _exitTimer?.cancel(); // Cancel timer on widget disposal
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        } else {
          if (_backPressCount == 0) {
            FloatingSnackBar(
              message: 'Press back again to exit',
              context: context,
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.white.withOpacity(0.9),
              textColor: CustomColor.secondary1,
            );
          }
          _startExitTimer();
          setState(() {
            _backPressCount++;
            _canPop = true;
          });
          if (_backPressCount == 2) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          toolbarHeight: 0.0,
        ),
        backgroundColor: CustomColor.primary,
        body: Column(
          children: [
            Image.asset(
              'assets/images/chara-1.png',
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(50.0),
                  //   topRight: Radius.circular(50.0),
                  // ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Welcome to IDNShop',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Crafted with care, consumed with confidence. Everyday prices. Explore a Diverse Range of Products.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        backgroundColor: CustomColor.primary,
                        minimumSize: const Size(
                          double.infinity,
                          50.0,
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
