import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/services/onboarding_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_habits_controller.g.dart';

@riverpod
class OnboardingHabitsDefaultController
    extends _$OnboardingHabitsDefaultController
    implements OnboardingHabitsController {
  @override
  OnboardingHabitsDefaultController? build({
    required final OnboardingNavigationService onboardingNavigationService,
  }) =>
      null;
  @override
  void onNext(BuildContext context) {
    onboardingNavigationService.showOnboardingStatistics(context);
  }
}
