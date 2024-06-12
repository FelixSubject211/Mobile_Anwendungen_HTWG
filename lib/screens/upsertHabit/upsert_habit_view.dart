import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_provider.dart';

class UpsertHabit extends ConsumerWidget {
  final Habit? habit;

  const UpsertHabit({super.key, this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpsertHabitController controller = ref.read(upsertHabitControllerProvider(habit));
    final UpsertHabitModel model = ref.watch(upsertHabitModelProvider(habit));

    return Text(model.toString());
  }
}

abstract class UpsertHabitController {
  void onNameChanged(String name);
  void onSave();
  void onCancel();
}
