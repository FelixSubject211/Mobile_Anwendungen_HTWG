import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/lang/codegen_loader.g.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_view.dart';

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

  testWidgets('Shows onboarding habits view', (tester) async {
    await tester.pumpWidget(EasyLocalization(
        path: 'assets/lang',
        supportedLocales: const [Locale('en'), Locale('de')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: UncontrolledProviderScope(
          container: providerContainer,
          child: const MyAppMock(child: OnboardingHabits()),
        )));
    await tester.pump();

    expect(find.text(LocaleKeys.onboardingHabitsTitle.tr()), findsOneWidget);
    expect(find.text(LocaleKeys.onboardingHabitsSubtitle.tr()), findsOneWidget);
    expect(
        find.bySemanticsLabel(LocaleKeys.progressButton.tr()), findsOneWidget);
  });
}
