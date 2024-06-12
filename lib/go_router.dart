import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/domain/navigation/navigation_service_routes.dart';
import 'package:mobile_anwendungen/ui/screens/navigation.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';

part 'go_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter goRouter(final GoRouterRef ref) => GoRouter(
      debugLogDiagnostics: kDebugMode,
      onException:
          (BuildContext context, GoRouterState state, GoRouter router) {
        debugPrint('GoRouter exception: ${state.error}');
      },
      routes: <RouteBase>[
        GoRoute(
          path: NavigationServiceRoutes.root,
          builder: (BuildContext context, GoRouterState state) {
            return const Navigation();
          },
        ),
        GoRoute(
          path: NavigationServiceRoutes.habitDetail,
          builder: (BuildContext context, GoRouterState state) {
            final habit = state.extra as Habit?;
            return HabitDetail(habit: habit);
          },
        ),
      ],
    );
