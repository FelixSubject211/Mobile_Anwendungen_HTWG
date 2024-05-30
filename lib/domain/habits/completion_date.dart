import 'package:objectbox/objectbox.dart';

@Entity()
class CompletionDate {
  int id = 0;

  @Transient()
  late DateTime date;

  int dateMillis;

  CompletionDate({
    required this.dateMillis,
  }) : date = DateTime.fromMillisecondsSinceEpoch(dateMillis, isUtc: true);

  CompletionDate.withDate({
    required this.date,
  }) : dateMillis = date.toUtc().millisecondsSinceEpoch;

  @override
  String toString() {
    return 'CompletionDate{id: $id, date: $date}';
  }
}
