import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/DayState.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/widgets/CalendarView.dart';
import 'package:mobile_anwendungen/widgets/CalendarWeekView.dart';

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

    return Expanded(
        child: ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return _weekCard(habits[index], startOfWeek);
      },
    ));
  }

  Widget _weekCard(Habit habit, DateTime startOfWeek) {
    return Column(
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
          selectedDate: DateTime.now(),
          displayedWeekStart: startOfWeek,
        )
      ],
    );
  }

  Widget _monthStatistic(BuildContext context, List<Habit> habits) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);

    return Expanded(
        child: ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return _monthCard(habits[index], startOfMonth);
      },
    ));
  }

  Widget _monthCard(Habit habit, DateTime startOfMonth) {
    return Column(
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
          displayedMonth: startOfMonth,
          selectedDate: DateTime.now(),
        ),
      ],
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
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        dayOfWeek,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
