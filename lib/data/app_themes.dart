import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF9C27B0);

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: primaryColor,

  fontFamily: 'RobotoCondensed',

  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
  ).copyWith(
    secondary: primaryColor,
    surface: Colors.grey[100],
  ),
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: CardThemeData(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primaryColor,

  fontFamily: 'RobotoCondensed',

  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.dark,
  ).copyWith(
    secondary: primaryColor,
    background: Colors.grey[900],
  ),
  scaffoldBackgroundColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[850],
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: CardThemeData(
    color: Colors.grey[800]!,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white70),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white70,
      backgroundColor: Colors.grey[800],
    ),
  ),
);