import 'dart:async';

import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/domain/habits/habit_repository_aggregator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'habit_default_repository.g.dart';

@Riverpod(keepAlive: true)
HabitRepositoryAggregator habitRepository(
  final HabitRepositoryRef ref,
) =>
    HabitDefaultRepository(database: ref.watch(objectBoxDatabaseProvider));

class HabitDefaultRepository extends HabitRepositoryAggregator {
  final _habitsSubject = BehaviorSubject<List<Habit>>();
  final Database database;

  HabitDefaultRepository({
    required this.database,
  }) : super();

  void _updateStream() {
    List<Habit> habits = database.listHabits();
    _habitsSubject.add(habits);
  }

  @override
  Stream<List<Habit>> listHabits() {
    _updateStream();
    return _habitsSubject.stream;
  }

  @override
  void upsertHabit(Habit habit) {
    database.upsertHabit(habit);
    _updateStream();
  }

  @override
  void completeHabit(Habit habit) {
    database.completeHabit(habit);
    _updateStream();
  }

  @override
  void unCompleteHabit(Habit habit) {
    database.unCompleteHabit(habit);
    _updateStream();
  }

  @override
  void reorderHabit(int oldIndex, int newIndex) {
    database.reorderHabit(oldIndex, newIndex);
    _updateStream();
  }

  @override
  void deleteHabit(Habit habit) {
    database.deleteHabit(habit);
    _updateStream();
  }
}
