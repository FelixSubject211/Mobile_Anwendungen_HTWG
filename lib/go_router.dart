// go_router.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

@Riverpod(keepAlive: false)
GoRouter goRouter() => GoRouter(
  debugLogDiagnostics: kDebugMode,
  navigatorKey: rootNavigatorKey,
  onException: (
      final BuildContext context,
      final GoRouterState state,
      final GoRouter router,
      ) {
    debugPrint('GoRouter exception: ${state.error}');
  },
  routes: <RouteBase>[

  ],
);