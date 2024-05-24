part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingPage1 extends OnboardingState {}

final class OnboardingPage2 extends OnboardingState {}

final class OnboardingPage3 extends OnboardingState {}

final class OnboardingDone extends OnboardingState {}
