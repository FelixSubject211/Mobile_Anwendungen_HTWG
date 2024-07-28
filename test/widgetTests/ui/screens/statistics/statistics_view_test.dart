import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_provider.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_view.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/mock_database.mocks.dart';
import '../../../helper/mock_habits.dart';
import '../../../helper/mock_my_app.dart';

void main() async {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  });

  final ProviderContainer providerContainer = ProviderContainer(overrides: [
    objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
    statisticsModelProvider.overrideWithValue(
      const StatisticsModel.loading(),
    ),
  ]);
  await providerContainer.read(objectBoxDatabaseProvider).init();

  testWidgets('Statistics view shows loading indicator', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Statistics()),
        )));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsAny);
  });

  testWidgets('Statistics view shows empty state', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      statisticsModelProvider.overrideWithValue(
        StatisticsModel.loaded(
            selectedButton: LocaleKeys.statisticsWeekSelection.tr(),
            habits: []),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Statistics()),
        )));
    await tester.pump();

    expect(find.text(LocaleKeys.textIfItIsEmpty.tr()), findsOneWidget);
  });

  testWidgets('Statistics view shows habits week view', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      statisticsModelProvider.overrideWithValue(
        StatisticsModel.loaded(
            selectedButton: LocaleKeys.statisticsWeekSelection.tr(),
            habits: habitsMock),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Statistics()),
        )));
    await tester.pump();

    expect(find.text("Habit 1"), findsOneWidget);
    expect(find.text("Habit 2"), findsOneWidget);
  });

  testWidgets('Statistics view shows habits month view', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      statisticsModelProvider.overrideWithValue(
        StatisticsModel.loaded(
            selectedButton: LocaleKeys.statisticsMonthSelection.tr(),
            habits: habitsMock),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Statistics()),
        )));
    await tester.pumpAndSettle();

    expect(find.text("Habit 1"), findsOneWidget);
  });
}
