import 'Habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> habits();
  void addHabit(Habit habit);
}