import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_controller.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'habits_provider.g.dart';

@riverpod
HabitsController habitsController(final HabitsControllerRef ref) => ref.watch(
      habitsDefaultControllerProvider(
              habitsNavigationService:
                  ref.watch(goRouterNavigationServiceProvider),
              habitRepository: ref.watch(habitRepositoryProvider))
          .notifier,
    );

@riverpod
HabitsModel habitsModel(final HabitsModelRef ref) => ref.watch(
      habitsDefaultControllerProvider(
          habitsNavigationService: ref.watch(goRouterNavigationServiceProvider),
          habitRepository: ref.watch(habitRepositoryProvider)),
    );
