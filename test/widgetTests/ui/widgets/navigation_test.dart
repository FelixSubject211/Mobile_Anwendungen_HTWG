import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_view.dart';
import 'package:mobile_anwendungen/ui/widgets/navigation.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/mock_database.mocks.dart';
import '../../helper/mock_my_app.dart';

void main() async {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  });

  final ProviderContainer providerContainer = ProviderContainer(overrides: [
    objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
  ]);
  await providerContainer.read(objectBoxDatabaseProvider).init();

  testWidgets('Navigation shows Habits screen by default', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Navigation()),
        )));
    await tester.pumpAndSettle();

    expect(find.byType(Habits), findsOneWidget);
  });

  testWidgets('Navigation maintains state when switching tabs', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Navigation()),
        )));
    await tester.pumpAndSettle();

    expect(find.byType(Habits), findsOneWidget);

    await tester.tap(find.byIcon(Icons.leaderboard));
    await tester.pump();

    expect(find.byType(Statistics), findsOneWidget);

    await tester.tap(find.byIcon(Icons.list));
    await tester.pumpAndSettle();

    expect(find.byType(Habits), findsOneWidget);
  });
}
