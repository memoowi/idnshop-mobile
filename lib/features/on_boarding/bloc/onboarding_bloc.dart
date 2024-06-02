import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
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
