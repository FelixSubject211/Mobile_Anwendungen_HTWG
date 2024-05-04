
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import '../../database/ObjectBox.dart';
import 'CompletionDate.dart';

@Entity()
class Habit {
  int id = 0;
  String name;

  int index;

  final completionDates = ToMany<CompletionDate>();

  Habit({
    required this.name,
    required this.index,
  });

  bool isCompletedToday() {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    return completionDates.any((completionDate) {
      final completionDateTime = DateTime.fromMillisecondsSinceEpoch(
          completionDate.dateMillis
      );
      final completionDateDate = DateTime(
          completionDateTime.year,
          completionDateTime.month,
          completionDateTime.day
      );
      return completionDateDate.isAtSameMomentAs(todayDate);
    });
  }

  static int newIndex() {
    final Box<Habit> habitBox = GetIt.instance.get<ObjectBox>().store.box<Habit>();
    final habits = habitBox.getAll();
    final maxIndex = habits.map((habit) => habit.index).fold(0, (prev, curr) => prev > curr ? prev : curr);
    return maxIndex + 1;
  }
}
