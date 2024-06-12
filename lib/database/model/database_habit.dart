import 'package:mobile_anwendungen/database/model/database_completion_date.dart';
import 'package:mobile_anwendungen/main.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class DatabaseHabit {
  int id = 0;
  String name;
  int index;
  int creationDate;

  final completionDates = ToMany<DatabaseCompletionDate>();

  DatabaseHabit({
    required this.name,
    required this.index,
    required this.creationDate,
  });

  DatabaseHabit.withCompletionDates({
    required this.name,
    required this.index,
    required this.creationDate,
    required List<DateTime> completionDates,
  }) {
    this.completionDates.addAll(completionDates.map((date) =>
        DatabaseCompletionDate(dateMillis: date.millisecondsSinceEpoch)));
  }

  static int newIndex() {
    final Box<DatabaseHabit> habitBox = objectBox.store.box<DatabaseHabit>();
    final habits = habitBox.getAll();
    final maxIndex = habits
        .map((habit) => habit.index)
        .fold(0, (prev, curr) => prev > curr ? prev : curr);
    return maxIndex + 1;
  }
}
