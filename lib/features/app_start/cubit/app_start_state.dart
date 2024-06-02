part of 'app_start_cubit.dart';

@immutable
sealed class AppStartState {}

final class AppStartInitial extends AppStartState {}

final class ToOnBoarding extends AppStartState {}

final class ToHome extends AppStartState {}
