import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upsert_habit_controller.g.dart';

@riverpod
class UpsertHabitDefaultController extends _$UpsertHabitDefaultController implements UpsertHabitController {

  @override
  UpsertHabitModel build(final Habit? habit) {
    return UpsertHabitModel(
        isInEditMode: habit != null,
        name: habit?.name ?? ""
    );
  }

  @override
  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  @override
  void onCancel() {

  }

  @override
  void onSave() {

  }
}