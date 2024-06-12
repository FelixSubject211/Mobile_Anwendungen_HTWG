import 'package:mobile_anwendungen/database/model/database_habit.dart';

import 'day_state.dart';

class Habit {
  String name;
  int index;
  DateTime creationDate;

  final List<DateTime> completionDates;

  Habit(
      {required this.name,
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
      return completionDateTime.isAfter(dateStart) &&
          completionDateTime.isBefore(dateEnd);
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
      name: name,
      index: index,
      creationDate: creationDate.millisecondsSinceEpoch,
      completionDates: completionDates,
    );
  }

  factory Habit.fromDatabaseHabit(DatabaseHabit databaseHabit) {
    return Habit(
        name: databaseHabit.name,
        index: databaseHabit.index,
        creationDate:
            DateTime.fromMillisecondsSinceEpoch(databaseHabit.creationDate),
        completionDates: databaseHabit.completionDates
            .map((dc) => DateTime.fromMillisecondsSinceEpoch(dc.dateMillis))
            .toList());
  }
}
