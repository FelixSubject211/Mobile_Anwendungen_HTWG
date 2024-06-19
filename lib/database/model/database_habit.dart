import 'package:mobile_anwendungen/common/completion_date.dart';
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
    this.id = 0,
    required this.name,
    required this.index,
    required this.creationDate,
  });

  DatabaseHabit.withCompletionDates({
    this.id = 0,
    required this.name,
    required this.index,
    required this.creationDate,
    required List<CompletionDate> completionDates,
  }) {
    this.completionDates.addAll(completionDates.map((date) =>
        DatabaseCompletionDate(
            id: date.id, dateMillis: date.dateTime.millisecondsSinceEpoch)));
  }
}
