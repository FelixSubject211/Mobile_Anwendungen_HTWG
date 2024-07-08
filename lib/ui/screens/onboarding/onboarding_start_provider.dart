import 'package:mobile_anwendungen/domain/habit/onboarding_default_repository.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_controller.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_start_provider.g.dart';

@riverpod
OnboardingStartController onboardingStartController(
        final OnboardingStartControllerRef ref) =>
    ref.watch(
      onboardingStartDefaultControllerProvider(
              onboardingNavigationService:
                  ref.watch(goRouterNavigationServiceProvider),
              onboardingRepository: ref.watch(onboardingRepositoryProvider))
          .notifier,
    );
