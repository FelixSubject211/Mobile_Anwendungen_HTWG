import 'package:freezed_annotation/freezed_annotation.dart';

part 'upsert_habit_model.freezed.dart';

@freezed
class UpsertHabitModel with _$UpsertHabitModel {
  factory UpsertHabitModel({
    required final bool isInEditMode,
    required final String name,
  }) = _UpsertHabitModel;
}
