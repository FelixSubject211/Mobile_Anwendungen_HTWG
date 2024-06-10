import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/domain/habits/habit_repository.dart';
import 'package:mobile_anwendungen/screens/list_habits/list_habits_model.dart';
import 'package:mobile_anwendungen/screens/list_habits/list_habits_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_habits_controller.g.dart';

@riverpod
class ListHabitsDefaultController extends _$ListHabitsDefaultController
    implements ListHabitsController {
  @override
  ListHabitsModel build({
    required final HabitRepository habitRepository,
  }) {
    return ListHabitsModel(
      habits: habitRepository.listHabits(),
    );
  }

  @override
  void showUpsertHabit(Habit? habit) {
    // ..
  }

  @override
  void onCompleteHabit(Habit habit) {
    habitRepository.completeHabit(habit);
  }

  @override
  void onUnCompleteHabit(Habit habit) {
    habitRepository.unCompleteHabit(habit);
  }

  @override
  void onReorder(int oldIndex, int newIndex) {
    habitRepository.reorderHabit(oldIndex, newIndex);
  }

  @override
  void onDeleteHabit(Habit habit) {
    habitRepository.deleteHabit(habit);
  }
}
