import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';

import '../../database/habits/HabitDatabaseDatasource.dart';

class HabitDefaultRepository extends HabitRepository {
  final _habitsController = StreamController<List<Habit>>.broadcast();
  final _databaseDatasource = GetIt.instance.get<HabitDatabaseDatasource>();

  HabitDefaultRepository() {
    _habitsController.onListen = updateStream;
  }

  void updateStream() {
    List<Habit> habits = _databaseDatasource.listHabits();
    _habitsController.add(habits);
  }

  @override
  Stream<List<Habit>> habits() {
    return _habitsController.stream;
  }

  @override
  void addHabit(Habit habit) {
    _databaseDatasource.addHabit(habit);
    List<Habit> habits = _databaseDatasource.listHabits();
    _habitsController.add(habits);
  }
}