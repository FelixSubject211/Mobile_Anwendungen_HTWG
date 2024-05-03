import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';

import '../../database/habits/HabitDatabaseDatasource.dart';

class HabitDefaultRepository extends HabitRepository {

  final _habitsController = StreamController<List<Habit>>.broadcast();
  final _databaseDatasource = GetIt.instance.get<HabitDatabaseDatasource>();

  HabitDefaultRepository() {
    _habitsController.onListen = _updateStream;
  }

  void _updateStream() {
    List<Habit> habits = _databaseDatasource.listHabits();
    _habitsController.add(habits);
  }

  @override
  Stream<List<Habit>> listHabits() {
    return _habitsController.stream;
  }

  @override
  void addHabit(Habit habit) {
    _databaseDatasource.addHabit(habit);
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
}