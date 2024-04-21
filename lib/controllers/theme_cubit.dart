import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false) {
    _getThemeFromPrefs();
  }

  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final bool isDarkModeEnabled = sharedPreferences.getBool('darkMode') ?? false;
    final bool savedTheme = isDarkModeEnabled == false ? false : true;
    emit(savedTheme);
  }

  Future<void> _saveThemeToPrefs({required bool darkModeEnabled}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('darkMode', darkModeEnabled);
  }

  void toggleTheme() {
    emit(state == false ? true : false);
    _saveThemeToPrefs(darkModeEnabled: state);
  }
}