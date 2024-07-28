import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/widgets/progress_button.dart';

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

  testWidgets('ProgressButton shows initial state', (tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: MyAppMock(child: Material(child: ProgressButton(onPressed: () {
            wasPressed = true;
          }))),
        )));
    await tester.pump();

    expect(find.byType(InkWell), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);

    await tester.tap(find.byType(InkWell));
    expect(wasPressed, isFalse);
  });

  testWidgets('ProgressButton triggers onPressed callback', (tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: MyAppMock(child: Material(child: ProgressButton(onPressed: () {
            wasPressed = true;
          }))),
        )));
    await tester.pump(const Duration(milliseconds: 5000));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(InkWell));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
