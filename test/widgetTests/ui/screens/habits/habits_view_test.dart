import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_provider.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
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
    habitsModelProvider.overrideWithValue(
      const HabitsModel.loading(),
    ),
  ]);
  await providerContainer.read(objectBoxDatabaseProvider).init();

  testWidgets('Habits view shows loading indicator', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Habits()),
        )));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Habits view shows empty state when no habits', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      habitsModelProvider.overrideWithValue(
        const HabitsModel.loaded(habits: [], isEditing: false),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Habits()),
        )));
    await tester.pump();

    expect(find.text(LocaleKeys.textIfItIsEmpty.tr()), findsOneWidget);
  });

  testWidgets('Habits view shows list of habits', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      habitsModelProvider.overrideWithValue(
        HabitsModel.loaded(habits: habitsMock, isEditing: false),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Habits()),
        )));
    await tester.pump();

    expect(find.byIcon(Icons.edit), findsOneWidget);
    expect(find.text("Habit 1"), findsOneWidget);
    expect(find.text("Habit 2"), findsOneWidget);
  });

  testWidgets('Habits view shows editable list of habits', (tester) async {
    providerContainer.updateOverrides([
      objectBoxDatabaseProvider.overrideWithValue(MockDatabase()),
      habitsModelProvider.overrideWithValue(
        HabitsModel.loaded(habits: habitsMock, isEditing: true),
      ),
    ]);
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: Habits()),
        )));
    await tester.pump();

    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.byIcon(Icons.delete_outline), findsAny);
    expect(find.byIcon(Icons.drag_handle_sharp), findsAny);
  });
}
