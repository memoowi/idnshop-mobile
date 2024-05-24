import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<DoneEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isOnboarded', true);
      emit(OnboardingDone());
    });

    on<CheckEvent>((event, emit) async {
      log('Checking onboarding');
      final prefs = await SharedPreferences.getInstance();
      final isOnboarded = prefs.getBool('isOnboarded') ?? false;
      if (isOnboarded) {
        log('Onboarding done');
        print(isOnboarded);
        emit(OnboardingDone());
      }

      log('Onboarding not done');
      emit(OnboardingInitial());
      log('state is ${state.runtimeType}');
    });
  }
}
