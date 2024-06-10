import 'package:mobile_anwendungen/database/object_box.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/habits/completion_date.dart';
import '../main.dart';
import '../objectbox.g.dart';

part 'object_box_database.g.dart';

@Riverpod(keepAlive: true)
Database objectBoxDatabase(
  final ObjectBoxDatabaseRef ref,
) =>
    ObjectBoxDatabase();

class ObjectBoxDatabase extends Database {
  final Box<Habit> _habitBox = objectBox.store.box<Habit>();

  ObjectBoxDatabase();

  @override
  void upsertHabit(Habit habit) {
    _habitBox.put(habit);
  }

  @override
  List<Habit> listHabits() {
    final habits = _habitBox.getAll();
    habits.sort((a, b) => a.index.compareTo(b.index));
    return habits;
  }

  @override
  void completeHabit(Habit habit) {
    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    final completionDate = CompletionDate(dateMillis: nowMillis);
    habit.completionDates.add(completionDate);
    _habitBox.put(habit);
  }

  @override
  void unCompleteHabit(Habit habit) {
    if (habit.completionDates.isNotEmpty) {
      habit.completionDates
          .sort((a, b) => b.dateMillis.compareTo(a.dateMillis));
      habit.completionDates.removeAt(0);
      _habitBox.put(habit);
    }
  }

  @override
  void reorderHabit(int oldIndex, int newIndex) {
    final habits = listHabits();

    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final habitToMove = habits.removeAt(oldIndex);
    habits.insert(newIndex, habitToMove);

    habits.asMap().forEach((index, habit) {
      habit.index = index;
    });

    _habitBox.putMany(habits);
  }

  @override
  void deleteHabit(Habit habit) {
    _habitBox.remove(habit.id);
  }
}
