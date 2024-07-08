// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $onboardingStartRoute,
      $onboardingHabitsRoute,
      $onboardingStatisticsRoute,
      $homeScreenRoute,
      $habitRoute,
    ];

RouteBase get $onboardingStartRoute => GoRouteData.$route(
      path: '/',
      factory: $OnboardingStartRouteExtension._fromState,
    );

extension $OnboardingStartRouteExtension on OnboardingStartRoute {
  static OnboardingStartRoute _fromState(GoRouterState state) =>
      OnboardingStartRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingHabitsRoute => GoRouteData.$route(
      path: '/onboarding/habits',
      factory: $OnboardingHabitsRouteExtension._fromState,
    );

extension $OnboardingHabitsRouteExtension on OnboardingHabitsRoute {
  static OnboardingHabitsRoute _fromState(GoRouterState state) =>
      OnboardingHabitsRoute();

  String get location => GoRouteData.$location(
        '/onboarding/habits',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingStatisticsRoute => GoRouteData.$route(
      path: '/onboarding/statistics',
      factory: $OnboardingStatisticsRouteExtension._fromState,
    );

extension $OnboardingStatisticsRouteExtension on OnboardingStatisticsRoute {
  static OnboardingStatisticsRoute _fromState(GoRouterState state) =>
      OnboardingStatisticsRoute();

  String get location => GoRouteData.$location(
        '/onboarding/statistics',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeScreenRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeScreenRouteExtension._fromState,
    );

extension $HomeScreenRouteExtension on HomeScreenRoute {
  static HomeScreenRoute _fromState(GoRouterState state) => HomeScreenRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $habitRoute => GoRouteData.$route(
      path: '/habit',
      factory: $HabitRouteExtension._fromState,
    );

extension $HabitRouteExtension on HabitRoute {
  static HabitRoute _fromState(GoRouterState state) => HabitRoute(
        id: _$convertMapValue('id', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/habit',
        queryParams: {
          if (id != null) 'id': id!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$goRouterHash() => r'94d3286c354f54c0c869811702cb2327d4be303a';

/// See also [goRouter].
@ProviderFor(goRouter)
final goRouterProvider = AutoDisposeProvider<GoRouter>.internal(
  goRouter,
  name: r'goRouterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$goRouterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoRouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
