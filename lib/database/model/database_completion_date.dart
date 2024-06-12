import 'package:objectbox/objectbox.dart';

@Entity()
class DatabaseCompletionDate {
  int id = 0;

  @Transient()
  late DateTime date;

  int dateMillis;

  DatabaseCompletionDate({
    required this.dateMillis,
  }) : date = DateTime.fromMillisecondsSinceEpoch(dateMillis, isUtc: true);

  DatabaseCompletionDate.withDate({
    required this.date,
  }) : dateMillis = date.toUtc().millisecondsSinceEpoch;

  @override
  String toString() {
    return 'CompletionDate{id: $id, date: $date}';
  }
}
