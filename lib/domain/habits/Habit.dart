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

  bool isCompletedOn(DateTime date) {
    final dateStart = DateTime(date.year, date.month, date.day);
    final dateEnd = dateStart.add(Duration(days: 1));
    return completionDates.any((completionDate) {
      final completionDateTime =
      DateTime.fromMillisecondsSinceEpoch(completionDate.dateMillis);
      return completionDateTime.isAfter(dateStart) &&
          completionDateTime.isBefore(dateEnd);
    });
  }

  bool isCompletedToday() {
    return isCompletedOn(DateTime.now());
  }

  List<bool> getCompletionForWeek(DateTime startOfWeek) {
    return List.generate(7, (index) {
      final date = startOfWeek.add(Duration(days: index));
      return isCompletedOn(date);
    });
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
}
