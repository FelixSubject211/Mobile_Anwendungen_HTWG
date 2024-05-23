import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

import '../common/SelectionButton.dart';
import '../common/YustoStreamBuilder.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  final HabitRepository _habitRepository =
      GetIt.instance.get<HabitRepository>();

  String _selectedButton = LocaleKeys.statisticsWeekSelection.tr();

  void _onButtonPressed(String label) {
    setState(() {
      _selectedButton = label;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.statisticsTitle.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _segmentedControl(theme),
            const SizedBox(height: 20),
            _selectedButton == LocaleKeys.statisticsWeekSelection.tr()
                ? _weekStatisticStreamBuilder()
                : _monthStatisticStreamBuilder()
          ],
        ),
      ),
    );
  }

  Widget _segmentedControl(ThemeData theme) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SelectionButton(
            label: LocaleKeys.statisticsWeekSelection.tr(),
            selectedButton: _selectedButton,
            onButtonPressed: _onButtonPressed,
            theme: theme,
          ),
          SelectionButton(
            label: LocaleKeys.statisticsMonthSelection.tr(),
            selectedButton: _selectedButton,
            onButtonPressed: _onButtonPressed,
            theme: theme,
          ),
        ],
      ),
    );
  }

  Widget _weekStatisticStreamBuilder() {
    return yustoStreamBuilder(
        stream: _habitRepository.listHabits(), onData: _weekStatistic);
  }

  Widget _monthStatisticStreamBuilder() {
    return yustoStreamBuilder(
        stream: _habitRepository.listHabits(), onData: _monthStatistic);
  }

  Widget _weekStatistic(BuildContext context, List<Habit> habits) {
    final startOfWeek =
        DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));

    return Column(
      children: habits.map((habit) {
        final completionForWeek = habit.getCompletionForWeek(startOfWeek);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.name),
            Row(
              children: List.generate(7, (index) {
                return Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.all(4),
                  color: completionForWeek[index] ? Colors.green : Colors.red,
                );
              }),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _monthStatistic(BuildContext context, List<Habit> habits) {
    return Text(habits.toString());
  }
}
