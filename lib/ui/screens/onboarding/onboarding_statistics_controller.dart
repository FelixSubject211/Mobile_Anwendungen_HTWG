import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/domain/habit/onboarding_repository.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/services/onboarding_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_statistics_controller.g.dart';

@riverpod
class OnboardingStatisticsDefaultController
    extends _$OnboardingStatisticsDefaultController
    implements OnboardingStatisticsController {
  @override
  OnboardingStatisticsDefaultController? build(
          {required final OnboardingNavigationService
              onboardingNavigationService,
          required final OnboardingRepository onboardingRepository}) =>
      null;
  @override
  void onNext(BuildContext context) {
    onboardingRepository.completeOnboarding();
    onboardingNavigationService.showHome(context);
  }
}
