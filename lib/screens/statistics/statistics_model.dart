

import 'package:freezed_annotation/freezed_annotation.dart';


part 'statistics_model.freezed.dart';

@freezed
class StatisticsModel {
  factory StatisticsModel({
    required final String selectedButton,
  }) = _StatisticsModel;
}