part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

class OnboardingPageChanged extends OnboardingState {
  final int currentIndex;
  OnboardingPageChanged(this.currentIndex);
}

final class OnboardingDone extends OnboardingState {}

final class OnboardingGetStarted extends OnboardingState {}
