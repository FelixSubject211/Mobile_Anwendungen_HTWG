import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_view.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_habits_provider.g.dart';

@riverpod
OnboardingHabitsController onboardingHabitsController(
        final OnboardingHabitsControllerRef ref) =>
    ref.watch(
      onboardingHabitsDefaultControllerProvider(
        onboardingNavigationService:
            ref.watch(goRouterNavigationServiceProvider),
      ).notifier,
    );
