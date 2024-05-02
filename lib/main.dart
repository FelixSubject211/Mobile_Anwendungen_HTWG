import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDatasource.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDefaultDatasource.dart';
import 'package:mobile_anwendungen/domain/habits/HabitDefaultRepository.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/MyTabBar.dart';

import 'database/ObjectBox.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingleton<ObjectBox>(await ObjectBox.create());
  GetIt.instance.registerSingleton<HabitDatabaseDatasource>(HabitsDatabaseDefaultDatasource());
  GetIt.instance.registerSingleton<HabitRepository>(HabitDefaultRepository());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyTabBar(),
    );
  }
}
