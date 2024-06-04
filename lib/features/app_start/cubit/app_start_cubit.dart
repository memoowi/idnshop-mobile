import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_start_state.dart';

class AppStartCubit extends Cubit<AppStartState> {
  AppStartCubit() : super(AppStartInitial());

  void appStartCheck() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboarded = prefs.getBool('isOnboarded') ?? false;
    if (isOnboarded) {
      emit(ToHome());
    } else {
      emit(ToOnBoarding());
    }
  }
}
