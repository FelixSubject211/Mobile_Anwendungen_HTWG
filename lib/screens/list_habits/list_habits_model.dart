import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';

part 'list_habits_model.freezed.dart';

@freezed
class ListHabitsModel with _$ListHabitsModel {
  const factory ListHabitsModel.loading() = _Loading;
  const factory ListHabitsModel.loaded({
    required List<Habit> habits,
  }) = _Loaded;
}
