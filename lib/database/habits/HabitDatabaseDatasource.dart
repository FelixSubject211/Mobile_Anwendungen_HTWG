import '../../domain/habits/Habit.dart';

abstract class HabitDatabaseDatasource {
    List<Habit> listHabits();
    void addHabit(Habit habit);
}