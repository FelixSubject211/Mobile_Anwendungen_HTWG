import 'dart:async';

import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import 'habit_repository.dart';

part 'habit_default_repository.g.dart';

@Riverpod(keepAlive: true)
HabitDefaultRepository habitRepository(
  final HabitRepositoryRef ref,
) =>
    HabitDefaultRepository(database: ref.watch(objectBoxDatabaseProvider));

class HabitDefaultRepository extends HabitRepository {
  final _habitsSubject = BehaviorSubject<List<Habit>>();
  final Database database;

  HabitDefaultRepository({
    required this.database,
  }) : super();

  void _updateStream() {
    List<Habit> habits = database
        .listHabits()
        .map((habit) => Habit.fromDatabaseHabit(habit))
        .toList();
    _habitsSubject.add(habits);
  }

  @override
  Stream<List<Habit>> listHabits() {
    _updateStream();
    return _habitsSubject.stream;
  }

  @override
  void upsertHabit(Habit habit) {
    database.upsertHabit(habit.toDataBaseHabit());
    _updateStream();
  }

  @override
  void completeHabit(Habit habit) {
    database.completeHabit(habit.toDataBaseHabit());
    _updateStream();
  }

  @override
  void unCompleteHabit(Habit habit) {
    database.unCompleteHabit(habit.toDataBaseHabit());
    _updateStream();
  }

  @override
  void reorderHabit(int oldIndex, int newIndex) {
    database.reorderHabit(oldIndex, newIndex);
    _updateStream();
  }

  @override
  void deleteHabit(Habit habit) {
    database.deleteHabit(habit.toDataBaseHabit());
    _updateStream();
  }

  @override
  int nextIndex() {
    return database.nextIndex();
  }
}
