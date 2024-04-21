import 'package:flutter/material.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      useMaterial3: true,
      // brightness: Brightness.light,
      colorScheme: const ColorScheme(
        background: Colors.white,
        brightness: Brightness.light,
        primary: Colors.green,
        onPrimary: Colors.white,
        secondary: Colors.yellow,
        onSecondary: Colors.orange,
        error: Colors.red,
        onError: Colors.black,
        onBackground: Colors.grey,
        surface: Colors.orange,
        onSurface: Colors.black,
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      useMaterial3: true,
      // brightness: Brightness.dark,
      colorScheme: const ColorScheme(
        background: Colors.black,
        brightness: Brightness.dark,
        primary: Colors.green,
        onPrimary: Colors.white,
        secondary: Colors.yellow,
        onSecondary: Colors.orange,
        error: Colors.red,
        onError: Colors.black,
        onBackground: Colors.grey,
        surface: Colors.red,
        onSurface: Colors.white,
      ),
    ),
  };
}

enum AppTheme {
  lightTheme,
  darkTheme,
}
