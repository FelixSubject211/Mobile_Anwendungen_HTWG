import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/domain/habits/habit_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../database/habits/habit_database_datasource.dart';

class HabitDefaultRepository extends HabitRepository {
  final _habitsSubject = BehaviorSubject<List<Habit>>();
  final _databaseDatasource = GetIt.instance.get<HabitDatabaseDatasource>();

  void _updateStream() {
    List<Habit> habits = _databaseDatasource.listHabits();
    _habitsSubject.add(habits);
  }

  @override
  Stream<List<Habit>> listHabits() {
    _updateStream();
    return _habitsSubject.stream;
  }

  @override
  void upsertHabit(Habit habit) {
    _databaseDatasource.upsertHabit(habit);
    _updateStream();
  }

  @override
  void completeHabit(Habit habit) {
    _databaseDatasource.completeHabit(habit);
    _updateStream();
  }

  @override
  void unCompleteHabit(Habit habit) {
    _databaseDatasource.unCompleteHabit(habit);
    _updateStream();
  }

  @override
  void reorderHabit(int oldIndex, int newIndex) {
    _databaseDatasource.reorderHabit(oldIndex, newIndex);
    _updateStream();
  }

  @override
  void deleteHabit(Habit habit) {
    _databaseDatasource.deleteHabit(habit);
    _updateStream();
  }
}
