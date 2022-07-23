import 'package:flutter/material.dart';
import 'package:proje/core/init/theme/app_theme.dart';
import 'dark_theme_interface.dart';

class AppThemeDark extends AppTheme with IDarkTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: _appColorScheme().background,
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: _appColorScheme().secondary)),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: _appColorScheme().background,
        filled: true,
        hintStyle: TextStyle(
          fontSize: 14,
          color: _appColorScheme().surface,
        ),
        labelStyle: TextStyle(
          fontSize: 13,
          color: _appColorScheme().surface,
        ),
        errorStyle: TextStyle(
          fontSize: 12,
          color: _appColorScheme().error,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15.5),
        hoverColor: _appColorScheme().secondary,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _appColorScheme().primary),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: _appColorScheme().secondary),
        ),
      ),
      colorScheme: _appColorScheme(),
      textTheme: textTheme());

  ColorScheme _appColorScheme() {
    return const ColorScheme(
        primary: Color(0xFF8BC9C7),
        onPrimary: Color(0xFF124E5C),
        secondary: Color(0xFFE78534),
        onSecondary: Color(0xFFEBA075),
        background: Color(0xFF1A242E),
        surface: Color(0xff211211),
        error: Color(0xffFF1F1F),
        onSurface: Color(0xff211211),
        onBackground: Color(0xFF4D6985),
        onError: Colors.white,
        brightness: Brightness.light);
  }

  TextTheme textTheme() {
    return TextTheme(
      button: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: textThemeDark.body,
      bodyText2: textThemeDark.bodySmall,
      headline1: textThemeDark.headline1,
      headline2: textThemeDark.headline2,
      headline3: textThemeDark.headline3,
      headline4: textThemeDark.headline4,
      headline5: textThemeDark.headline5,
    );
  }
}
