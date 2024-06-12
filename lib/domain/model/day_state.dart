import 'package:flutter/material.dart';

enum DayState {
  done,
  notDone,
  habitNotCreatedYet,
  futureDate,
}

extension DayStateExtension on DayState {
  Color getColor() {
    switch (this) {
      case DayState.done:
        return Colors.green;
      case DayState.notDone:
        return Colors.red;
      case DayState.habitNotCreatedYet:
        return Colors.grey;
      case DayState.futureDate:
        return Colors.grey;
      default:
        return Colors.white;
    }
  }
}
