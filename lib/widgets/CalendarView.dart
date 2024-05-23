import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

import '../common/SelectionButton.dart';
import '../common/YustoStreamBuilder.dart';
import 'package:intl/intl.dart'; // Import für Datumshandhabung

class CalendarView extends StatelessWidget {
  final Widget Function(DateTime date, bool isSelected) dayBuilder;
  final Widget Function(String month, int year) headerBuilder;
  final Widget Function(String dayOfWeek) dayOfWeekLabelBuilder;
  final DateTime selectedDate;
  final DateTime displayedMonth;

  CalendarView({
    required this.dayBuilder,
    required this.headerBuilder,
    required this.dayOfWeekLabelBuilder,
    required this.displayedMonth,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final daysInCurrentMonth = _monthLength(displayedMonth.month, displayedMonth.year);
    final previousMonthDays = _calculateVisibleDaysOfPreviousMonth(displayedMonth.month, displayedMonth.year);

    return Column(
      children: [
        headerBuilder(DateFormat.MMMM().format(displayedMonth), displayedMonth.year),
        GridView.builder(
          shrinkWrap: true,
          itemCount: daysInCurrentMonth + previousMonthDays + 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return _buildItem(
              index,
              previousMonthDays,
              daysInCurrentMonth,
              displayedMonth,
              selectedDate,
            );
          },
        ),
      ],
    );
  }

  Widget _buildItem(
      int iteration,
      int previousMonthDays,
      int daysInCurrentMonth,
      DateTime displayedMonth,
      DateTime selectedDate,
      ) {
    if (iteration < 7) {
      return dayOfWeekLabelBuilder(DateFormat.E().format(DateTime(2021, 1, iteration + 4)));
    } else if (iteration >= previousMonthDays + 7 && iteration < previousMonthDays + 7 + daysInCurrentMonth) {
      final date = DateTime(displayedMonth.year, displayedMonth.month, iteration - (previousMonthDays + 6));
      final isSelected = date.year == selectedDate.year && date.month == selectedDate.month && date.day == selectedDate.day;
      return dayBuilder(date, isSelected);
    } else {
      return Container();
    }
  }

  int _calculateVisibleDaysOfPreviousMonth(int month, int year) {
    final firstDayOfMonth = DateTime(year, month, 1);
    return firstDayOfMonth.weekday % 7;
  }

  int _monthLength(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }
}