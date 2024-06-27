import 'package:flutter/widgets.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
import 'package:mobile_anwendungen/ui/screens/habits/services/habits_navigation_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_controller.g.dart';

@riverpod
class HabitsDefaultController extends _$HabitsDefaultController
    implements HabitsController {
  @override
  HabitsModel build({
    required final HabitsNavigationService habitsNavigationService,
    required final HabitRepository habitRepository,
  }) {
    habitRepository.habits().listen((List<Habit> habits) {
      state = state.when(
        loading: () => HabitsModel.loaded(habits: habits, isEditing: false),
        loaded: (_, isEditing) =>
            HabitsModel.loaded(habits: habits, isEditing: isEditing),
      );
    });

    return const HabitsModel.loading();
  }

  @override
  void toggleEditing() {
    state = state.when(
      loading: () => state,
      loaded: (habits, isEditing) =>
          HabitsModel.loaded(habits: habits, isEditing: !isEditing),
    );
  }

  @override
  void showHabitDetail(int? id, BuildContext context) {
    habitsNavigationService.showHabitDetail(id, context);
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
