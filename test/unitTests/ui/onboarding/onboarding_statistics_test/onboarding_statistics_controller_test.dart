import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/onboarding_service/onboarding_default_service.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/'
    'onboarding_controller_provider/onboarding_statistics_provider/'
    'onboarding_statistics_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@GenerateMocks([GoRouterNavigationService, OnboardingDefaultService])
import '../onboarding_statistics_test/onboarding_statistics_controller_test.mocks.dart';

void main() {
  late MockGoRouterNavigationService mockOnboardingNavigationService;
  late MockOnboardingDefaultService mockOnboardingService;

  setUp(() {
    mockOnboardingNavigationService = MockGoRouterNavigationService();
    mockOnboardingService = MockOnboardingDefaultService();
  });

  group('OnboardingStatisticsDefaultController', () {
    test('onNext completes onboarding and shows home', () {
      final container = ProviderContainer(
        overrides: [
          goRouterNavigationServiceProvider
              .overrideWithValue(mockOnboardingNavigationService),
          onboardingServiceProvider.overrideWithValue(mockOnboardingService),
        ],
      );

      final controller = container.read(onboardingStatisticsControllerProvider);
      final BuildContext context = MockBuildContext();

      controller.onNext(context);

      verify(mockOnboardingService.completeOnboarding()).called(1);
      verify(mockOnboardingNavigationService.showHome(context)).called(1);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
