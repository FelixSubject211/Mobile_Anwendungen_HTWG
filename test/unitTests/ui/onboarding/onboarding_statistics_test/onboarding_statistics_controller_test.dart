import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/habit/onboarding_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_controller.dart';
import 'package:riverpod/riverpod.dart';

@GenerateMocks([GoRouterNavigationService, OnboardingDefaultRepository])
import '../onboarding_statistics_test/onboarding_statistics_controller_test.mocks.dart';

void main() {
  late MockGoRouterNavigationService mockOnboardingNavigationService;
  late MockOnboardingDefaultRepository mockOnboardingRepository;

  setUp(() {
    mockOnboardingNavigationService = MockGoRouterNavigationService();
    mockOnboardingRepository = MockOnboardingDefaultRepository();
  });

  group('OnboardingStatisticsDefaultController', () {
    test('onNext completes onboarding and shows home', () {
      final container = ProviderContainer(
        overrides: [
          goRouterNavigationServiceProvider.overrideWithValue(mockOnboardingNavigationService),
          onboardingRepositoryProvider.overrideWithValue(mockOnboardingRepository),
        ],
      );

      final controller = container.read(onboardingStatisticsControllerProvider);
      final BuildContext context = MockBuildContext();

      controller.onNext(context);

      verify(mockOnboardingRepository.completeOnboarding()).called(1);
      verify(mockOnboardingNavigationService.showHome(context)).called(1);
    });
  });
}

class MockBuildContext extends Mock implements BuildContext {}
