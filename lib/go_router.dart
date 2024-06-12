import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/domain/navigation/navigation_service_routes.dart';
import 'package:mobile_anwendungen/screens/navigation.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'domain/habits/habit.dart';

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
          path: NavigationServiceRoutes.upsertHabit,
          builder: (BuildContext context, GoRouterState state) {
            final habit = state.extra as Habit?;
            return UpsertHabit(habit: habit);
          },
        ),
      ],
    );
