import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDatasource.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDefaultDatasource.dart';
import 'package:mobile_anwendungen/domain/habits/HabitDefaultRepository.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/Navigation.dart';

import 'database/ObjectBox.dart';
import 'lang/codegen_loader.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<ObjectBox>(await ObjectBox.create());
  GetIt.instance.registerSingleton<HabitDatabaseDatasource>(
      HabitsDatabaseDefaultDatasource());
  GetIt.instance.registerSingleton<HabitRepository>(HabitDefaultRepository());

  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/lang',
    supportedLocales: const [
      Locale('de'),
    ],
    fallbackLocale: const Locale('de'),
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}

// Muhammed was here

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
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
      ),
      debugShowCheckedModeBanner: false,
      home: const Navigation(),
    );
  }
}
