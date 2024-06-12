import 'package:flutter/material.dart';

final theme = ThemeData(
  fontFamily: 'RobotoFlex',
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
  ),
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
