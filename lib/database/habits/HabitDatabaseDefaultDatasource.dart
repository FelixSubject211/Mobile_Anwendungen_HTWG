import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/database/ObjectBox.dart';
import 'package:mobile_anwendungen/database/habits/HabitDatabaseDatasource.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';

import '../../objectbox.g.dart';

class HabitsDatabaseDefaultDatasource extends HabitDatabaseDatasource {

  late Box<Habit> _habitBox;

  HabitsDatabaseDefaultDatasource() {
    _habitBox = GetIt.instance.get<ObjectBox>().store.box<Habit>();
  }

  @override
  void addHabit(Habit habit) {
    _habitBox.put(habit);
  }

  @override
  List<Habit> listHabits() {
    return _habitBox.getAll();
  }
}