import 'Habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> listHabits();
  void addHabit(Habit habit);
}