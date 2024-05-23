import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarWeekView extends StatelessWidget {
  final Widget Function(DateTime date, bool isSelected) dayBuilder;
  final Widget Function(String weekLabel) headerBuilder;
  final Widget Function(String dayOfWeek) dayOfWeekLabelBuilder;
  final DateTime selectedDate;
  final DateTime displayedWeekStart;

  const CalendarWeekView({
    super.key,
    required this.dayBuilder,
    required this.headerBuilder,
    required this.dayOfWeekLabelBuilder,
    required this.displayedWeekStart,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final daysOfWeek = _calculateDaysOfWeek(displayedWeekStart);

    return Column(
      children: [
        headerBuilder(_formatWeekLabel(displayedWeekStart)),
        GridView.builder(
          shrinkWrap: true,
          itemCount: 7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return _buildItem(
              daysOfWeek[index],
              selectedDate,
            );
          },
        ),
      ],
    );
  }

  Widget _buildItem(DateTime date, DateTime selectedDate) {
    final isSelected = date.year == selectedDate.year &&
        date.month == selectedDate.month &&
        date.day == selectedDate.day;
    return Column(
      children: [
        dayOfWeekLabelBuilder(DateFormat.E().format(date)),
        dayBuilder(date, isSelected),
      ],
    );
  }

  List<DateTime> _calculateDaysOfWeek(DateTime startOfWeek) {
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  String _formatWeekLabel(DateTime startOfWeek) {
    final endOfWeek = startOfWeek.add(Duration(days: 6));
    final dateFormat = DateFormat.MMMd().format(startOfWeek) +
        ' - ' +
        DateFormat.MMMd().format(endOfWeek);
    return dateFormat;
  }
}
