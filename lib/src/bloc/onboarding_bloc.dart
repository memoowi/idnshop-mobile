import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<NextPageEvent>((event, emit) {
      if (state is OnboardingInitial) {
        emit(OnboardingPage1());
      } else if (state is OnboardingPage1) {
        emit(OnboardingPage2());
      } else if (state is OnboardingPage2) {
        emit(OnboardingPage3());
      }
    });

    on<PreviousPageEvent>((event, emit) {
      if (state is OnboardingPage3) {
        emit(OnboardingPage2());
      } else if (state is OnboardingPage2) {
        emit(OnboardingPage1());
      } else if (state is OnboardingPage1) {
        emit(OnboardingInitial());
      }
    });

    on<DoneEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isOnboarded', true);
      emit(OnboardingDone());
    });

    on<CheckEvent>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final isOnboarded = prefs.getBool('isOnboarded') ?? false;
      if (isOnboarded) {
        emit(OnboardingDone());
      }
      emit(OnboardingInitial());
    });
  }
}
