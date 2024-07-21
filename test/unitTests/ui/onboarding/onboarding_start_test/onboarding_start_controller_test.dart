import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/habit/onboarding_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod/riverpod.dart';

@GenerateMocks([GoRouterNavigationService, OnboardingDefaultRepository])
import '../onboarding_start_test/onboarding_start_controller_test.mocks.dart';

void main() {
  late MockGoRouterNavigationService mockGoRouterNavigationService;
  late MockOnboardingDefaultRepository mockOnboardingRepository;

  setUp(() {
    mockGoRouterNavigationService = MockGoRouterNavigationService();
    mockOnboardingRepository = MockOnboardingDefaultRepository();
  });

  group('OnboardingStartDefaultController', () {
    test('onStart calls showOnboardingHabits', () {
      final container = ProviderContainer(
        overrides: [
          goRouterNavigationServiceProvider.overrideWithValue(mockGoRouterNavigationService),
          onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
        ],
      );

      final controller = container.read(onboardingStartControllerProvider);
      final BuildContext context = MockBuildContext();

      controller.onStart(context);

      verify(mockGoRouterNavigationService.showOnboardingHabits(context)).called(1);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
