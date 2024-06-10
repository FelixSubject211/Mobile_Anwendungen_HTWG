import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_provider.dart';
import 'package:mobile_anwendungen/screens/upsert_habit.dart';

class UpsertHabit extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpsertHabitController controller =
        ref.read(upsertHabitControllerProvider);
    final UpsertHabitModel model = ref.watch(upsertHabitModelProvider);

    return Text(model.toString());
  }
}

abstract class UpsertHabitController {
  void onNameChanged(String name);
  void onSave();
  void onCancel();
}
