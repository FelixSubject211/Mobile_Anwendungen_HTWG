import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper/mock_database.mocks.dart';
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
  ]);
  await providerContainer.read(objectBoxDatabaseProvider).init();

  testWidgets('Shows Habit Add Page', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: HabitDetail(id: null)),
        )));
    await tester.pumpAndSettle();

    expect(find.text(LocaleKeys.habitDetailAddTitle.tr()), findsOneWidget);
    expect(find.text(LocaleKeys.habitDetailNameLabelText.tr()), findsOneWidget);
    expect(find.text(LocaleKeys.cancel.tr()), findsOneWidget);
    expect(find.text(LocaleKeys.save.tr()), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.byType(TextButton), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Shows Habit Edit Page', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: HabitDetail(id: 1)),
        )));
    await tester.pumpAndSettle();

    expect(find.text(LocaleKeys.habitDetailEditTitle.tr()), findsOneWidget);
  });
}
