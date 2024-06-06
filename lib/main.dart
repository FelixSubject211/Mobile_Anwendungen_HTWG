import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/database/habits/habit_database_datasource.dart';
import 'package:mobile_anwendungen/database/habits/habit_database_default_datasource.dart';
import 'package:mobile_anwendungen/domain/habits/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/habits/habit_repository.dart';
import 'package:mobile_anwendungen/screens/navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/screens/upsert_habit.dart';

import 'database/object_box.dart';
import 'domain/habits/habit.dart';
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
    final goRouter = GoRouter(
      debugLogDiagnostics: kDebugMode,
      onException:
          (BuildContext context, GoRouterState state, GoRouter router) {
        debugPrint('GoRouter exception: ${state.error}');
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const Navigation();
          },
        ),
        GoRoute(
          path: '/upsertHabit',
          builder: (BuildContext context, GoRouterState state) {
            final habit = state.extra as Habit?;
            return UpsertHabit(habit: habit);
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: goRouter,
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
    );
  }
}
