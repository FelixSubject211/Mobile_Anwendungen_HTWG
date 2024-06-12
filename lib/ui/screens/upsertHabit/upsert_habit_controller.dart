import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/ui/screens/upsertHabit/services/upsert_habit_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/ui/screens/upsertHabit/upsert_habit_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upsert_habit_controller.g.dart';

@riverpod
class UpsertHabitDefaultController extends _$UpsertHabitDefaultController
    implements UpsertHabitController {
  @override
  UpsertHabitModel build(
      {required final UpsertHabitNavigationService upsertHabitNavigationService,
      required final HabitRepository habitRepository,
      required final Habit? habit}) {
    return UpsertHabitModel(
        isInEditMode: habit != null, name: habit?.name ?? "");
  }

  @override
  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  @override
  void onCancel() {
    upsertHabitNavigationService.pop();
  }

  @override
  void onSave() {
    if (state.isInEditMode) {
      habit?.name = state.name;
      habitRepository.upsertHabit(habit!);
    } else {
      habitRepository.upsertHabit(Habit(
          name: state.name,
          index: habitRepository.nextIndex(),
          creationDate: DateTime.now(),
          completionDates: []));
    }
    upsertHabitNavigationService.pop();
  }
}
