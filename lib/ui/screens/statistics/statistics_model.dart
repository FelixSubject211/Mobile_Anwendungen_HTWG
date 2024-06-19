import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';

part 'statistics_model.freezed.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  const factory StatisticsModel.loading() = _Loading;
  const factory StatisticsModel.loaded({
    required String selectedButton,
    required List<Habit> habits,
  }) = _Loaded;
}
