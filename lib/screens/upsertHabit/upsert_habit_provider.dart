
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_controller.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/habits/habit.dart';

part 'upsert_habit_provider.g.dart';

@riverpod
UpsertHabitController upsertHabitController(UpsertHabitControllerRef ref, Habit? habit) {
  return ref.watch(upsertHabitDefaultControllerProvider(habit).notifier);
}

@riverpod
UpsertHabitModel upsertHabitModel(UpsertHabitModelRef ref, Habit? habit) {
  return ref.watch(upsertHabitDefaultControllerProvider(habit));
}