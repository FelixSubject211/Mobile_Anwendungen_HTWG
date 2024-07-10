import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../go_router.dart';
import '../../lang/locale_keys.g.dart';
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
  void showHabitDetail(int? id, BuildContext context) {
    HabitRoute(id: id).go(context);
  }

  @override
  void showConfirmDeleteAlert(VoidCallback onConfirm) {
    BuildContext? context =
        _goRouter.routerDelegate.navigatorKey.currentContext;

    if (context != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(LocaleKeys.confirmDeleteTitle.tr()),
            content: Text(LocaleKeys.confirmDeleteMessage.tr()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(LocaleKeys.cancel.tr()),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm();
                },
                child: Text(LocaleKeys.delete.tr()),
              ),
            ],
          );
        },
      );
    } else {
      showSnackBar(LocaleKeys.unknownErrorOccurred.tr());
    }
  }

  @override
  void showSnackBar(final String message) {
    BuildContext? context =
        _goRouter.routerDelegate.navigatorKey.currentContext;

    if (context != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void showOnboardingHabits(BuildContext context) {
    OnboardingHabitsRoute().go(context);
  }

  @override
  void showOnboardingStatistics(BuildContext context) {
    OnboardingStatisticsRoute().go(context);
  }

  @override
  void showHome(BuildContext context) {
    OnboardingStartRoute().go(context);
  }
}
