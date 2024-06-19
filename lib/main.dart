import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/go_router.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final ProviderContainer providerContainer = ProviderContainer();
  await providerContainer.read(objectBoxDatabaseProvider).init();

  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('de')],
      fallbackLocale: const Locale('de'),
      assetLoader: const CodegenLoader(),
      child: UncontrolledProviderScope(
        container: providerContainer,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
