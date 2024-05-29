import 'dart:ui';

import 'package:flutter/material.dart';

enum DayState {
  Done,
  NotDone,
  HabitNotCreatedYet,
  FutureDate,
}

extension DayStateExtension on DayState {
  Color getColor() {
    switch (this) {
      case DayState.Done:
        return Colors.green;
      case DayState.NotDone:
        return Colors.red;
      case DayState.HabitNotCreatedYet:
        return Colors.grey;
      case DayState.FutureDate:
        return Colors.grey;
      default:
        return Colors.white;
    }
  }
}