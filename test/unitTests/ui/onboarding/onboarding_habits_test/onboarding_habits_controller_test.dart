import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

@GenerateMocks([GoRouterNavigationService])
import '../onboarding_habits_test/onboarding_habits_controller_test.mocks.dart';

void main() {
  late MockGoRouterNavigationService mockGoRouterNavigationService;

  setUp(() {
    mockGoRouterNavigationService = MockGoRouterNavigationService();
  });

  group('OnboardingHabitsDefaultController', () {
    test('onNext calls showOnboardingStatistics', () {
      final container = ProviderContainer(
        overrides: [
          goRouterNavigationServiceProvider.overrideWithValue(mockGoRouterNavigationService),
        ],
      );

      final controller = container.read(onboardingHabitsControllerProvider);
      final BuildContext context = MockBuildContext();

      controller.onNext(context);

      verify(mockGoRouterNavigationService.showOnboardingStatistics(context)).called(1);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
