import 'package:mobile_anwendungen/database/model/database_completion_date.dart';
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
}
