import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/ui/screens/navigation.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

@TypedGoRoute<HomeScreenRoute>(path: '/', routes: [
  TypedGoRoute<HabitRoute>(
    path: 'habit',
  )
])
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Navigation();
  }
}

@immutable
class HabitRoute extends GoRouteData {
  final int? id;

  const HabitRoute({
    this.id,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HabitDetail(id: id);
  }
}

@riverpod
GoRouter goRouter(final GoRouterRef ref) => GoRouter(
      debugLogDiagnostics: kDebugMode,
      onException:
          (BuildContext context, GoRouterState state, GoRouter router) {
        debugPrint('GoRouter exception: ${state.error}');
      },
      routes: $appRoutes,
    );
