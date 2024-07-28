import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/ui/widgets/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final ProviderContainer providerContainer = ProviderContainer();
  await providerContainer.read(objectBoxDatabaseProvider).init();

  runApp(
    EasyLocalization(
      path: 'assets/lang',
      supportedLocales: const [Locale('en'), Locale('de')],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: UncontrolledProviderScope(
        container: providerContainer,
        child: const MyApp(),
      ),
    ),
  );
}
