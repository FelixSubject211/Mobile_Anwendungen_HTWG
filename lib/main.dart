import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDatasource.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDefaultDatasource.dart';
import 'package:mobile_anwendungen/domain/habits/HabitDefaultRepository.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/MyTabBar.dart';

import 'database/ObjectBox.dart';
import 'domain/habits/Habit.dart';
import 'lang/codegen_loader.g.dart';
import 'objectbox.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<ObjectBox>(await ObjectBox.create());
  GetIt.instance.registerSingleton<HabitDatabaseDatasource>(HabitsDatabaseDefaultDatasource());
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyTabBar(),
    );
  }
}
