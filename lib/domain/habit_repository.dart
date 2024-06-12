import 'model/habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> listHabits();
  void upsertHabit(Habit habit);
  void completeHabit(Habit habit);
  void unCompleteHabit(Habit habit);
  void reorderHabit(int oldIndex, int newIndex);
  void deleteHabit(Habit habit);
}
