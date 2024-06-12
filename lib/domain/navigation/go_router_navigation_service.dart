import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/navigation/navigation_service_routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../go_router.dart';
import 'navigation_service_aggregator.dart';

part 'go_router_navigation_service.g.dart';

@riverpod
NavigationServiceAggregator goRouterNavigationService(
  final GoRouterNavigationServiceRef ref,
) =>
    GoRouterNavigationService(goRouter: ref.watch(goRouterProvider));

class GoRouterNavigationService implements NavigationServiceAggregator {
  final GoRouter _goRouter;

  GoRouterNavigationService({
    required final GoRouter goRouter,
  }) : _goRouter = goRouter;

  @override
  void pop<T>({T? data}) {
    _goRouter.pop(data);
  }

  @override
  void showHabitDetail(Habit? habit) {
    _goRouter.push(NavigationServiceRoutes.habitDetail, extra: habit);
  }
}
