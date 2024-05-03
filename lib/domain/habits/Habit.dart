import 'package:objectbox/objectbox.dart';

import 'CompletionDate.dart';

@Entity()
class Habit {
  int id = 0;
  String name;

  final completionDates = ToMany<CompletionDate>();

  Habit({
    required this.name,
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
}
