import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<StatefulWidget> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  int _selectedSegment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.statisticsTitle.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _segmentedControl(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _segmentedControl() {
    return CupertinoSegmentedControl<int>(
      children: {
        0: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(LocaleKeys.statisticsWeekSelection.tr()),
        ),
        1: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(LocaleKeys.statisticsMonthSelection.tr()),
        ),
      },
      onValueChanged: (int value) {
        setState(() {
          _selectedSegment = value;
        });
      },
      groupValue: _selectedSegment,
    );
  }
}