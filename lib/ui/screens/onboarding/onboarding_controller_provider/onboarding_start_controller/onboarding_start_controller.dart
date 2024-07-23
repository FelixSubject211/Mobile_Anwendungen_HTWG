import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/domain/onboarding_service/onboarding_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/services/onboarding_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_start_controller.g.dart';

@riverpod
class OnboardingStartDefaultController
    extends _$OnboardingStartDefaultController
    implements OnboardingStartController {
  @override
  OnboardingStartDefaultController? build(
          {required final OnboardingNavigationService
              onboardingNavigationService,
          required final OnboardingService onboardingService}) =>
      null;

  @override
  void onStart(BuildContext context) {
    onboardingNavigationService.showOnboardingHabits(context);
  }
}
