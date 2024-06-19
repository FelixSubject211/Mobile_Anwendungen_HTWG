import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_detail_model.freezed.dart';

@freezed
class HabitDetailModel with _$HabitDetailModel {
  factory HabitDetailModel({
    required final bool isInEditMode,
    required final String name,
  }) = _HabitDetailModel;
}
