import 'Habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> listHabits();
  void addHabit(Habit habit);
  void completeHabit(Habit habit);
  void unCompleteHabit(Habit habit);
  void reorderHabit(int oldIndex, int newIndex);
  void deleteHabit(Habit habit);
}