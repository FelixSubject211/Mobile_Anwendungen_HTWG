import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/domain/habit/onboarding_default_repository.dart';
import 'package:mobile_anwendungen/ui/screens/navigation.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_view.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'go_router.g.dart';

@TypedGoRoute<OnboardingStartRoute>(path: '/')
@immutable
class OnboardingStartRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    var onboardingRepository =
        ProviderScope.containerOf(context).read(onboardingRepositoryProvider);

    return onboardingRepository.isCompletedOnboarding()
        ? const Navigation()
        : const OnboardingStart();
  }
}

@TypedGoRoute<OnboardingHabitsRoute>(path: '/onboarding/habits')
@immutable
class OnboardingHabitsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingHabits();
  }
}

@TypedGoRoute<OnboardingStatisticsRoute>(path: '/onboarding/statistics')
@immutable
class OnboardingStatisticsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OnboardingStatistics();
  }
}

@TypedGoRoute<HomeScreenRoute>(path: '/home')
@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Navigation();
  }
}

@TypedGoRoute<HabitRoute>(path: '/habit')
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
