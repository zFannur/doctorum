import 'package:doctorum/const/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      hintColor: Colors.black,
      navigationBarTheme: const NavigationBarThemeData(
        indicatorColor: AppColors.primaryColor,
        backgroundColor: AppColors.backgroundColor,
      ));

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    hintColor: Colors.white,
  );
}
