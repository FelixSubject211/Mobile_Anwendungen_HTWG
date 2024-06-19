import 'package:mobile_anwendungen/domain/habit/model/habit.dart';

abstract class HabitRepository {
  Stream<List<Habit>> habits();
  void upsertHabit(Habit habit);
  void completeHabit(Habit habit);
  void unCompleteHabit(Habit habit);
  void reorderHabit(int oldIndex, int newIndex);
  void deleteHabit(Habit habit);
  int nextIndex();
}
