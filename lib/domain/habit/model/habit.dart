import 'package:mobile_anwendungen/database/model/database_habit.dart';
import 'package:mobile_anwendungen/common/completion_date.dart';

import 'day_state.dart';

class Habit {
  int id;
  String name;
  int index;
  DateTime creationDate;

  final List<CompletionDate> completionDates;

  Habit(
      {this.id = 0,
      required this.name,
      required this.index,
      required this.creationDate,
      required this.completionDates});

  DayState dayStateOn(DateTime date) {
    final dateStart = DateTime(date.year, date.month, date.day);
    final dateEnd = dateStart.add(const Duration(days: 1));

    final currentDate = DateTime.now();
    final currentDateStart =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    if (dateStart.isAfter(currentDateStart)) {
      return DayState.futureDate;
    }

    if (dateEnd.isBefore(creationDate)) {
      return DayState.habitNotCreatedYet;
    }

    if (completionDates.any((completionDate) {
      final completionDateTime = completionDate;
      return completionDateTime.dateTime.isAfter(dateStart) &&
          completionDateTime.dateTime.isBefore(dateEnd);
    })) {
      return DayState.done;
    } else {
      return DayState.notDone;
    }
  }

  DayState isCompletedToday() {
    return dayStateOn(DateTime.now());
  }

  DatabaseHabit toDataBaseHabit() {
    return DatabaseHabit.withCompletionDates(
      id: id,
      name: name,
      index: index,
      creationDate: creationDate.millisecondsSinceEpoch,
      completionDates: completionDates,
    );
  }

  factory Habit.fromDatabaseHabit(DatabaseHabit databaseHabit) {
    return Habit(
        id: databaseHabit.id,
        name: databaseHabit.name,
        index: databaseHabit.index,
        creationDate:
            DateTime.fromMillisecondsSinceEpoch(databaseHabit.creationDate),
        completionDates: databaseHabit.completionDates
            .map((dc) => CompletionDate(
                id: dc.id,
                dateTime: DateTime.fromMillisecondsSinceEpoch(dc.dateMillis)))
            .toList());
  }
}
