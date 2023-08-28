import 'package:doctorum/resource/const/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      hintColor: Colors.black,
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: AppColors.backgroundColor2,
        backgroundColor: AppColors.backgroundColor,
      ));

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    hintColor: Colors.white,
  );
}
