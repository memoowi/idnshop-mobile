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
      final prefs = await SharedPreferences.getInstance();
      final isOnboarded = prefs.getBool('isOnboarded') ?? false;
      if (isOnboarded) {
        emit(OnboardingDone());
      }

      emit(OnboardingInitial());
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
