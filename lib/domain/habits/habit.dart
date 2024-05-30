import 'package:get_it/get_it.dart';
import 'package:collection/collection.dart';
import 'package:mobile_anwendungen/domain/habits/habit_frequency.dart';
import 'package:objectbox/objectbox.dart';
import '../../database/object_box.dart';
import 'completion_date.dart';
import 'day_state.dart';

@Entity()
class Habit {
  int id = 0;
  String name;
  int index;
  int creationDate;
  @Transient()
  HabitFrequency? frequency;
  bool reminding;

  final completionDates = ToMany<CompletionDate>();

  Habit({
    required this.name,
    required this.index,
    required this.creationDate,
    required this.reminding,
  });

  DayState dayStateOn(DateTime date) {
    final dateStart = DateTime(date.year, date.month, date.day);
    final dateEnd = dateStart.add(const Duration(days: 1));

    final currentDate = DateTime.now();
    final currentDateStart =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    if (dateStart.isAfter(currentDateStart)) {
      return DayState.futureDate;
    }

    if (dateEnd.isBefore(DateTime.fromMillisecondsSinceEpoch(creationDate))) {
      return DayState.habitNotCreatedYet;
    }

    if (completionDates.any((completionDate) {
      final completionDateTime =
          DateTime.fromMillisecondsSinceEpoch(completionDate.dateMillis);
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

  static int newIndex() {
    final Box<Habit> habitBox =
        GetIt.instance.get<ObjectBox>().store.box<Habit>();
    final habits = habitBox.getAll();
    final maxIndex = habits
        .map((habit) => habit.index)
        .fold(0, (prev, curr) => prev > curr ? prev : curr);
    return maxIndex + 1;
  }

  int? get habitFrequency {
    _ensureStableEnumValues();
    return frequency?.value;
  }

  set habitFrequency(int? value) {
    _ensureStableEnumValues();
    frequency = HabitFrequency.values
        .firstWhereOrNull((element) => element.value == value);
  }

  void _ensureStableEnumValues() {
    assert(HabitFrequency.daily.value == 1);
    assert(HabitFrequency.weekly.value == 7);
    assert(HabitFrequency.monthly.value == 30);
  }
}
