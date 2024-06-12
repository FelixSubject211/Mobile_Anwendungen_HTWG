import 'package:mobile_anwendungen/domain/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit_repository.dart';
import 'package:mobile_anwendungen/screens/list_habits/list_habits_model.dart';
import 'package:mobile_anwendungen/screens/list_habits/list_habits_view.dart';
import 'package:mobile_anwendungen/screens/list_habits/services/list_habits_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_habits_controller.g.dart';

@riverpod
class ListHabitsDefaultController extends _$ListHabitsDefaultController
    implements ListHabitsController {
  @override
  ListHabitsModel build({
    required final ListHabitsNavigationService listHabitsNavigationService,
    required final HabitRepository habitRepository,
  }) {
    habitRepository.listHabits().listen((List<Habit> habits) {
      state = state.when(
        loading: () => ListHabitsModel.loaded(habits: habits),
        loaded: (_) => ListHabitsModel.loaded(habits: habits),
      );
    });

    return const ListHabitsModel.loading();
  }

  @override
  void showUpsertHabit(Habit? habit) {
    listHabitsNavigationService.showUpsertHabit(habit);
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
