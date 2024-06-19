import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_controller.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_model.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';

part 'habit_detail_provider.g.dart';

@riverpod
HabitDetailController habitDetailController(
    HabitDetailControllerRef ref, Habit? habit) {
  return ref.watch(habitDetailDefaultControllerProvider(
          habitDetailNavigationService:
              ref.watch(goRouterNavigationServiceProvider),
          habitRepository: ref.watch(habitRepositoryProvider),
          habit: habit)
      .notifier);
}

@riverpod
HabitDetailModel habitDetailModel(HabitDetailModelRef ref, Habit? habit) {
  return ref.watch(habitDetailDefaultControllerProvider(
      habitDetailNavigationService:
          ref.watch(goRouterNavigationServiceProvider),
      habitRepository: ref.watch(habitRepositoryProvider),
      habit: habit));
}
