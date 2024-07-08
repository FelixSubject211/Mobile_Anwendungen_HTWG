import 'package:mobile_anwendungen/ui/screens/habits/services/habits_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/services/habit_detail_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/services/onboarding_navigation_service.dart';

import 'general_navigation_service.dart';

abstract interface class NavigationServiceAggregator
    implements
        GeneralNavigationService,
        OnboardingNavigationService,
        HabitsNavigationService,
        HabitDetailNavigationService {}
