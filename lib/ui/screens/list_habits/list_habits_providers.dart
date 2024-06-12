import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/list_habits/list_habits_controller.dart';
import 'package:mobile_anwendungen/ui/screens/list_habits/list_habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/list_habits/list_habits_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_habits_providers.g.dart';

@riverpod
ListHabitsController listHabitsController(final ListHabitsControllerRef ref) =>
    ref.watch(
      ListHabitsDefaultControllerProvider(
              listHabitsNavigationService:
                  ref.watch(goRouterNavigationServiceProvider),
              habitRepository: ref.watch(habitRepositoryProvider))
          .notifier,
    );

@riverpod
ListHabitsModel listHabitsModel(final ListHabitsModelRef ref) => ref.watch(
      ListHabitsDefaultControllerProvider(
          listHabitsNavigationService:
              ref.watch(goRouterNavigationServiceProvider),
          habitRepository: ref.watch(habitRepositoryProvider)),
    );
