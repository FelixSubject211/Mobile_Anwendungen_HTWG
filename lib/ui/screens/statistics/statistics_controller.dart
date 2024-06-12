import 'package:easy_localization/easy_localization.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

part 'statistics_controller.g.dart';

@riverpod
class StatisticsDefaultController extends _$StatisticsDefaultController
    implements StatisticsController {
  @override
  StatisticsModel build({
    required final HabitRepository habitRepository,
  }) {
    habitRepository.listHabits().listen((List<Habit> habits) {
      state = state.when(
        loading: () => StatisticsModel.loaded(
          selectedButton: LocaleKeys.statisticsWeekSelection.tr(),
          habits: habits,
        ),
        loaded: (selectedButton, _) => StatisticsModel.loaded(
          selectedButton: selectedButton,
          habits: habits,
        ),
      );
    });

    return const StatisticsModel.loading();
  }

  @override
  void onSegmentedControlPressed(String label) {
    state = state.when(
      loading: () => const StatisticsModel.loading(),
      loaded: (_, habits) => StatisticsModel.loaded(
        selectedButton: label,
        habits: habits,
      ),
    );
  }
}
