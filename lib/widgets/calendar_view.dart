import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarMonthView extends StatefulWidget {
  final Widget Function(DateTime date, bool isSelected) dayBuilder;
  final Widget Function(String month, int year) headerBuilder;
  final Widget Function(String dayOfWeek) dayOfWeekLabelBuilder;
  final DateTime selectedDate;

  const CalendarMonthView({
    super.key,
    required this.dayBuilder,
    required this.headerBuilder,
    required this.dayOfWeekLabelBuilder,
    required this.selectedDate,
  });

  @override
  CalendarMonthViewState createState() => CalendarMonthViewState();
}

class CalendarMonthViewState extends State<CalendarMonthView> {
  late DateTime displayedMonth;

  @override
  void initState() {
    super.initState();
    displayedMonth = widget.selectedDate;
  }

  void _goToNextMonth() {
    setState(() {
      displayedMonth =
          DateTime(displayedMonth.year, displayedMonth.month + 1, 1);
    });
  }

  void _goToPreviousMonth() {
    setState(() {
      displayedMonth =
          DateTime(displayedMonth.year, displayedMonth.month - 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInCurrentMonth =
        _monthLength(displayedMonth.month, displayedMonth.year);
    final previousMonthDays = _calculateVisibleDaysOfPreviousMonth(
        displayedMonth.month, displayedMonth.year);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: _goToPreviousMonth,
            ),
            widget.headerBuilder(
              DateFormat.MMMM(context.locale.toString()).format(displayedMonth),
              displayedMonth.year,
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: _goToNextMonth,
            ),
          ],
        ),
        _buildCalendar(daysInCurrentMonth, previousMonthDays, displayedMonth),
      ],
    );
  }

  Widget _buildCalendar(
      int daysInCurrentMonth, int previousMonthDays, DateTime displayedMonth) {
    final totalItems = daysInCurrentMonth + previousMonthDays + 7;

    return SizedBox(
      height: 400,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: totalItems,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return _buildItem(index, previousMonthDays, daysInCurrentMonth,
              displayedMonth, widget.selectedDate);
        },
      ),
    );
  }

  Widget _buildItem(int iteration, int previousMonthDays,
      int daysInCurrentMonth, DateTime displayedMonth, DateTime selectedDate) {
    if (iteration < 7) {
      return widget.dayOfWeekLabelBuilder(
          DateFormat.E((context.locale.toString()))
              .format(DateTime(2021, 1, iteration + 4)));
    } else if (iteration >= previousMonthDays + 7 &&
        iteration < previousMonthDays + 7 + daysInCurrentMonth) {
      final date = DateTime(displayedMonth.year, displayedMonth.month,
          iteration - (previousMonthDays + 6));
      final isSelected = date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day;
      return widget.dayBuilder(date, isSelected);
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
