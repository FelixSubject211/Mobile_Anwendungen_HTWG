import 'package:flutter/widgets.dart';
import 'package:mobile_anwendungen/domain/navigation/general_navigation_service.dart';

abstract class OnboardingNavigationService implements GeneralNavigationService {
  void showOnboardingHabits(BuildContext context);
  void showOnboardingStatistics(BuildContext context);
  void showHome(BuildContext context);
}
