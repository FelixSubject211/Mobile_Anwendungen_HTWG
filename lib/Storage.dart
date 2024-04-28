import 'domain/Habit.dart';

class Storage {
  static final List<Habit> habits = [];

  static void addHabit(String name) {
    Habit newHabit = Habit(id: 1, name: name);
    habits.add(newHabit);
  }
}