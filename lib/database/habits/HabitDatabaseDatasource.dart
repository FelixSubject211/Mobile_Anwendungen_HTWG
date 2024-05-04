import '../../domain/habits/Habit.dart';

abstract class HabitDatabaseDatasource {
    List<Habit> listHabits();
    void addHabit(Habit habit);
    void completeHabit(Habit habit);
    void unCompleteHabit(Habit habit);
    void reorderHabit(int oldIndex, int newIndex);
}