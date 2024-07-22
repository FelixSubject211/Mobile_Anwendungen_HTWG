import 'package:mobile_anwendungen/domain/onboarding_service/onboarding_default_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_view.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/'
    'onboarding_controller_provider/onboarding_statistics_controller/'
    'onboarding_statistics_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_statistics_provider.g.dart';

@riverpod
OnboardingStatisticsController onboardingStatisticsController(
        final OnboardingStatisticsControllerRef ref) =>
    ref.watch(
      onboardingStatisticsDefaultControllerProvider(
              onboardingNavigationService:
                  ref.watch(goRouterNavigationServiceProvider),
              onboardingService: ref.watch(onboardingServiceProvider))
          .notifier,
    );
