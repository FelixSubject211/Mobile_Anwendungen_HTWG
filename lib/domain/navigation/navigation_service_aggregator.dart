import 'package:mobile_anwendungen/ui/screens/list_habits/services/list_habits_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/upsertHabit/services/upsert_habit_navigation_service.dart';

import 'general_navigation_service.dart';

abstract interface class NavigationServiceAggregator
    implements
        GeneralNavigationService,
        ListHabitsNavigationService,
        UpsertHabitNavigationService {}
