part of 'onboarding_bloc.dart';

@immutable
sealed class OnboardingEvent {}

class NextPageEvent extends OnboardingEvent {}

class PreviousPageEvent extends OnboardingEvent {}

class UpdatePageEvent extends OnboardingEvent {
  final int newIndex;
  UpdatePageEvent(this.newIndex);
}

class DoneEvent extends OnboardingEvent {}

class CheckEvent extends OnboardingEvent {}
