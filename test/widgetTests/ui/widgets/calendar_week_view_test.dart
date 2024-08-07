import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/widgets/calendar_week_view.dart';

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

  testWidgets('CalendarWeekView shows header and days of the week',
      (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: MyAppMock(
              child: ListView(children: [
            CalendarWeekView(
              dayBuilder: (date, isSelected) => Text('${date.day}'),
              headerBuilder: (weekLabel) => Text(weekLabel),
              dayOfWeekLabelBuilder: (dayOfWeek) => Text(dayOfWeek),
              selectedDate: DateTime(2023, 10, 1),
              creationDate: DateTime(2023, 1, 1),
            ),
          ])),
        )));
    await tester.pump();

    expect(find.text('Sep 25 - Oct 1'), findsOneWidget);
    expect(find.text('Mon'), findsOneWidget);
    expect(find.text('Tue'), findsOneWidget);
    expect(find.text('Wed'), findsOneWidget);
    expect(find.text('Thu'), findsOneWidget);
    expect(find.text('Fri'), findsOneWidget);
    expect(find.text('Sat'), findsOneWidget);
    expect(find.text('Sun'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    for (int i = 25; i <= 30; i++) {
      expect(find.text('$i'), findsOneWidget);
    }
  });

  testWidgets('CalendarWeekView navigates to next month', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: MyAppMock(
              child: ListView(children: [
            CalendarWeekView(
              dayBuilder: (date, isSelected) => Text('${date.day}'),
              headerBuilder: (weekLabel) => Text(weekLabel),
              dayOfWeekLabelBuilder: (dayOfWeek) => Text(dayOfWeek),
              selectedDate: DateTime(2023, 10, 1),
              creationDate: DateTime(2023, 1, 1),
            ),
          ])),
        )));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    expect(find.text('Oct 2 - Oct 8'), findsOneWidget);
  });

  testWidgets('CalendarWeekView navigates to previous month', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: MyAppMock(
              child: ListView(children: [
            CalendarWeekView(
              dayBuilder: (date, isSelected) => Text('${date.day}'),
              headerBuilder: (weekLabel) => Text(weekLabel),
              dayOfWeekLabelBuilder: (dayOfWeek) => Text(dayOfWeek),
              selectedDate: DateTime(2023, 10, 1),
              creationDate: DateTime(2023, 1, 1),
            ),
          ])),
        )));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('Sep 18 - Sep 24'), findsOneWidget);
  });
}
