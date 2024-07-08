import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/go_router.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp.router(
              routerConfig: ref.watch(goRouterProvider),
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              theme: theme.copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: <TargetPlatform, PageTransitionsBuilder>{
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
                  },
                ),
              ),
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              builder: (final _, final Widget? child) =>
                  ResponsiveBreakpoints.builder(
                child: child!,
                breakpoints: <Breakpoint>[
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                    start: 1921,
                    end: double.infinity,
                    name: '4K',
                  ),
                ],
              ),
            ));
  }
}
