import 'package:mobile_anwendungen/domain/model/habit.dart';
import 'package:mobile_anwendungen/domain/navigation/general_navigation_service.dart';

abstract class ListHabitsNavigationService implements GeneralNavigationService {
  void showUpsertHabit(Habit? habit);
}
