import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/database/object_box.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/objectbox.g.dart';
import 'model/database_completion_date.dart';
import 'model/database_habit.dart';

part 'object_box_database.g.dart';

@Riverpod(keepAlive: true)
Database objectBoxDatabase(
  final ObjectBoxDatabaseRef ref,
) =>
    ObjectBoxDatabase();

class ObjectBoxDatabase extends Database {
  late final ObjectBox _objectBox;
  late final Box<DatabaseHabit> _habitBox;

  ObjectBoxDatabase();

  @override
  Future<void> init() async {
    _objectBox = await ObjectBox.create();
    _habitBox = _objectBox.store.box<DatabaseHabit>();
  }

  @override
  void upsertHabit(DatabaseHabit habit) {
    _habitBox.put(habit);
  }

  @override
  List<DatabaseHabit> listHabits() {
    final habits = _habitBox.getAll();
    habits.sort((a, b) => a.index.compareTo(b.index));
    return habits;
  }

  @override
  void completeHabit(DatabaseHabit habit) {
    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    final completionDate = DatabaseCompletionDate(dateMillis: nowMillis);
    habit.completionDates.add(completionDate);
    _habitBox.put(habit);
  }

  @override
  void unCompleteHabit(DatabaseHabit habit) {
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
  void deleteHabit(DatabaseHabit habit) {
    _habitBox.remove(habit.id);
  }

  @override
  int nextIndex() {
    final habits = _habitBox.getAll();
    final maxIndex = habits
        .map((habit) => habit.index)
        .fold(0, (prev, curr) => prev > curr ? prev : curr);
    return maxIndex + 1;
  }
}
