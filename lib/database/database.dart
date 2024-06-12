import 'package:mobile_anwendungen/database/model/database_habit.dart';

abstract class Database {
  List<DatabaseHabit> listHabits();
  void upsertHabit(DatabaseHabit habit);
  void completeHabit(DatabaseHabit habit);
  void unCompleteHabit(DatabaseHabit habit);
  void reorderHabit(int oldIndex, int newIndex);
  void deleteHabit(DatabaseHabit habit);
}
