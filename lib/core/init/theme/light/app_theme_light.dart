import 'package:flutter/material.dart';
import 'package:proje/core/init/theme/app_theme.dart';
import 'package:proje/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: _appColorScheme().background,
      textButtonTheme: TextButtonThemeData(
        style:
            TextButton.styleFrom(backgroundColor: _appColorScheme().secondary),
      ),
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
        primary: Color(0xFF7BD1CE),
        onPrimary: Color(0xFF2494AD),
        secondary: Color(0xFFECB25A),
        onSecondary: Color(0xFFF1EDDA),
        background: Color(0xFFFAF9F9),
        surface: Color(0xff211211),
        error: Color(0xffFF1F1F),
        onSurface: Color(0xff211211),
        onBackground: Colors.white, 
        onError: Colors.white,
        brightness: Brightness.light);
  }

  TextTheme textTheme() {
    return TextTheme(
      button: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      bodyText1: textThemeLight.body,
      bodyText2: textThemeLight.bodySmall,
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      headline3: textThemeLight.headline3,
      headline4: textThemeLight.headline4,
      headline5: textThemeLight.headline5,
    );
  }
}