import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/model/day_state.dart';
import 'package:mobile_anwendungen/domain/model/habit.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/screens/statistics/statistics_model.dart';
import 'package:mobile_anwendungen/screens/statistics/statistics_provider.dart';
import 'package:mobile_anwendungen/widgets/calendar_view.dart';
import 'package:mobile_anwendungen/widgets/calendar_week_view.dart';

import '../../common/selection_button.dart';

class Statistics extends ConsumerWidget {
  const Statistics({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final StatisticsController controller =
        ref.read(statisticsControllerProvider);
    final StatisticsModel model = ref.watch(statisticsModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.statisticsTitle.tr()),
      ),
      body: model.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (selectedButton, habits) =>
            _onData(context, controller, selectedButton, habits),
      ),
    );
  }

  Widget _segmentedControl(
      ThemeData theme, StatisticsController controller, String selectedButton) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectionButton(
            label: LocaleKeys.statisticsWeekSelection.tr(),
            selectedButton: selectedButton,
            onButtonPressed: controller.onSegmentedControlPressed,
            theme: theme,
          ),
          SelectionButton(
            label: LocaleKeys.statisticsMonthSelection.tr(),
            selectedButton: selectedButton,
            onButtonPressed: controller.onSegmentedControlPressed,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _onData(BuildContext context, StatisticsController controller,
      String selectedButton, List<Habit> habits) {
    if (habits.isEmpty) {
      return _emptyState(context);
    } else {
      final theme = Theme.of(context);

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _segmentedControl(theme, controller, selectedButton),
            const SizedBox(height: 20),
            selectedButton == LocaleKeys.statisticsWeekSelection.tr()
                ? _weekStatistic(context, habits)
                : _monthStatistic(context, habits)
          ],
        ),
      );
    }
  }

  Widget _weekStatistic(BuildContext context, List<Habit> habits) {
    final startOfWeek =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

    return Expanded(
      child: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _weekCard(context, habits[index], startOfWeek),
          );
        },
      ),
    );
  }

  Widget _weekCard(BuildContext context, Habit habit, DateTime startOfWeek) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.name, style: Theme.of(context).textTheme.titleMedium),
            CalendarWeekView(
                dayBuilder: (date, isSelected) {
                  return _dayBuilder(date, isSelected, habit);
                },
                headerBuilder: (weekLabel) {
                  return _headerBuilderWeek(weekLabel);
                },
                dayOfWeekLabelBuilder: (dayOfWeek) {
                  return _dayOfWeekLabelBuilder(dayOfWeek);
                },
                selectedDate: DateTime.now())
          ],
        ),
      ),
    );
  }

  Widget _monthStatistic(BuildContext context, List<Habit> habits) {
    return Expanded(
      child: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _monthCard(context, habits[index]),
          );
        },
      ),
    );
  }

  Widget _monthCard(BuildContext context, Habit habit) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.name, style: Theme.of(context).textTheme.titleMedium),
            CalendarMonthView(
              dayBuilder: (date, isSelected) {
                return _dayBuilder(date, isSelected, habit);
              },
              headerBuilder: (month, year) {
                return _headerBuilderMonth(month, year);
              },
              dayOfWeekLabelBuilder: (dayOfWeek) {
                return _dayOfWeekLabelBuilder(dayOfWeek);
              },
              selectedDate: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dayBuilder(DateTime date, bool isSelected, Habit habit) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: habit.dayStateOn(date).getColor(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          date.day.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _headerBuilderMonth(String month, int year) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '$month $year',
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _headerBuilderWeek(String weekLabel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        weekLabel,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _dayOfWeekLabelBuilder(String dayOfWeek) {
    return Center(
      child: Text(
        dayOfWeek,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/emptyStatistics.png'),
          Text(
            LocaleKeys.textIfItIsEmpty.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

abstract class StatisticsController {
  void onSegmentedControlPressed(String label);
}
