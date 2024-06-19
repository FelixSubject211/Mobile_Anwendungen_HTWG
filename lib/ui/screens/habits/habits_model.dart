import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';

part 'habits_model.freezed.dart';

@freezed
class HabitsModel with _$HabitsModel {
  const factory HabitsModel.loading() = _Loading;
  const factory HabitsModel.loaded({
    required List<Habit> habits,
  }) = _Loaded;
}
