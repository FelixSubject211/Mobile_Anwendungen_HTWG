

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/habits/habit.dart';


part 'statistics_model.freezed.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  factory StatisticsModel({
    required final String selectedButton,
    required final List<Habit> habits
  }) = _StatisticsModel;
}