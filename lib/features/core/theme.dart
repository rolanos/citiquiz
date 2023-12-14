import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsUI.white,
    fontFamily: 'Montserrat',
    useMaterial3: true,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color: ColorsUI.lime),
      unselectedLabelStyle: TextStyle(color: Colors.white),
      selectedItemColor: ColorsUI.lime,
      unselectedItemColor: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: ColorsUI.white, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(
        color: ColorsUI.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: ColorsUI.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: ColorsUI.white,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
