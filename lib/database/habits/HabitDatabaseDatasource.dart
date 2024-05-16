import '../../domain/habits/Habit.dart';

abstract class HabitDatabaseDatasource {
  List<Habit> listHabits();
  void upsertHabit(Habit habit);
  void completeHabit(Habit habit);
  void unCompleteHabit(Habit habit);
  void reorderHabit(int oldIndex, int newIndex);
  void deleteHabit(Habit habit);
}
