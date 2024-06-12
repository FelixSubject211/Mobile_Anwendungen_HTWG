import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_controller.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'statistics_provider.g.dart';

@riverpod
StatisticsController statisticsController(final StatisticsControllerRef ref) =>
    ref.watch(StatisticsDefaultControllerProvider(
            habitRepository: ref.watch(habitRepositoryProvider))
        .notifier);

@riverpod
StatisticsModel statisticsModel(final StatisticsModelRef ref) =>
    ref.watch(StatisticsDefaultControllerProvider(
        habitRepository: ref.watch(habitRepositoryProvider)));
