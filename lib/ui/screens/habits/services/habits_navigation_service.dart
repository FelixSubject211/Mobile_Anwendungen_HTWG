import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/navigation/general_navigation_service.dart';

abstract class HabitsNavigationService implements GeneralNavigationService {
  void showHabitDetail(Habit? habit);
}
