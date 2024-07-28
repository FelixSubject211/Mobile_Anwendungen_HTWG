import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CalendarMonthView extends StatefulWidget {
  final Widget Function(DateTime date, bool isSelected) dayBuilder;
  final Widget Function(String month, int year) headerBuilder;
  final Widget Function(String dayOfWeek) dayOfWeekLabelBuilder;
  final DateTime selectedDate;
  final DateTime creationDate;

  const CalendarMonthView({
    super.key,
    required this.dayBuilder,
    required this.headerBuilder,
    required this.dayOfWeekLabelBuilder,
    required this.selectedDate,
    required this.creationDate,
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

  DateTime get _previousMonth {
    return DateTime(displayedMonth.year, displayedMonth.month - 1, 1);
  }

  void _goToPreviousMonth() {
    setState(() {
      displayedMonth = _previousMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInCurrentMonth =
        _monthLength(displayedMonth.month, displayedMonth.year);
    final previousMonthDays = _calculateVisibleDaysOfPreviousMonth(
        displayedMonth.month, displayedMonth.year);
    final totalItems = daysInCurrentMonth + previousMonthDays + 7;
    final rows = (totalItems / 7).ceil();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_previousMonth.year > widget.creationDate.year ||
                _previousMonth.month >= widget.creationDate.month)
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _goToPreviousMonth,
              )
            else
              const Opacity(
                opacity: 0.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: null,
                ),
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
        _buildCalendar(
            daysInCurrentMonth, previousMonthDays, displayedMonth, rows),
      ],
    );
  }

  Widget _buildCalendar(int daysInCurrentMonth, int previousMonthDays,
      DateTime displayedMonth, int rows) {
    final totalItems = daysInCurrentMonth + previousMonthDays + 7;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double itemWidth = constraints.maxWidth / 7;

        return Wrap(
          children: List.generate(totalItems, (index) {
            return SizedBox(
              width: itemWidth,
              height: itemWidth,
              child: _buildItem(index, previousMonthDays, daysInCurrentMonth,
                  displayedMonth, widget.selectedDate),
            );
          }),
        );
      },
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
          iteration - previousMonthDays - 6);
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
    return (firstDayOfMonth.weekday + 6) % 7;
  }

  int _monthLength(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }
}
