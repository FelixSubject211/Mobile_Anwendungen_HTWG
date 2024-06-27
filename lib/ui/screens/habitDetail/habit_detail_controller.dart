import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/services/habit_detail_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_model.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habit_detail_controller.g.dart';

@riverpod
class HabitDetailDefaultController extends _$HabitDetailDefaultController
    implements HabitDetailController {
  @override
  HabitDetailModel build(
      {required final HabitDetailNavigationService habitDetailNavigationService,
      required final HabitRepository habitRepository,
      required final int? id}) {
    var name = '';
    if (id != null) {
      name = habitRepository.getById(id)?.name ?? '';
    }
    return HabitDetailModel(isInEditMode: id != null, name: name);
  }

  @override
  void onNameChanged(String name) {
    state = state.copyWith(name: name);
  }

  @override
  void onCancel() {
    habitDetailNavigationService.pop();
  }

  @override
  void onSave() {
    if (state.isInEditMode) {
      if (id == null) {
        return;
      }

      var habit = habitRepository.getById(id!);
      habit?.name = state.name;
      habitRepository.upsertHabit(habit!);
    } else {
      habitRepository.upsertHabit(Habit(
          name: state.name,
          index: habitRepository.nextIndex(),
          creationDate: DateTime.now(),
          completionDates: []));
    }
    habitDetailNavigationService.pop();
  }
}
