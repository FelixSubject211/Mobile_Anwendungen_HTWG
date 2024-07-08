import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  fontFamily: 'RobotoFlex',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme:
      const AppBarTheme(backgroundColor: Colors.white, titleSpacing: 16.0),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: CircleBorder(),
    backgroundColor: Colors.indigoAccent,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
  )),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.indigo,
  )),
  useMaterial3: true,
);

final darkTheme = ThemeData.dark().copyWith(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: CircleBorder(),
    ),
    appBarTheme: const AppBarTheme(titleSpacing: 16.0));
