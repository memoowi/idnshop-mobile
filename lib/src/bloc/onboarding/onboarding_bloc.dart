import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<CheckEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isOnboarded = prefs.getBool('isOnboarded') ?? false;
      if (isOnboarded) {
        emit(OnboardingDone());
      } else {
        emit(OnboardingPageChanged(0));
      }
      FlutterNativeSplash.remove();
      log('state is ${state.runtimeType}');
    });

    on<SkipEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isOnboarded', true);
      emit(OnboardingDone());
    });

    on<GetStartedEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isOnboarded', true);
      emit(OnboardingGetStarted());
    });

    on<NextPageEvent>((event, emit) {
      if (state is OnboardingPageChanged) {
        int currentIndex = (state as OnboardingPageChanged).currentIndex;
        emit(OnboardingPageChanged(currentIndex + 1));
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state is OnboardingPageChanged) {
        int currentIndex = (state as OnboardingPageChanged).currentIndex;
        emit(OnboardingPageChanged(currentIndex - 1));
      }
    });

    on<UpdatePageEvent>((event, emit) {
      emit(OnboardingPageChanged(event.newIndex));
    });
  }
}
