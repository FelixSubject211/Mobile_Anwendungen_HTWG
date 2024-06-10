import 'package:mobile_anwendungen/screens/statistics/statistics_controller.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_controller.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upsert_habit_provider.g.dart';

@riverpod
UpsertHabitController upsertHabitController(
        final UpsertHabitControllerRef ref) =>
    ref.watch(upsertHabitControllerProvider);

@riverpod
UpsertHabitModel upsertHabitModel(final UpsertHabitModelRef ref) =>
    ref.watch(upsertHabitModelProvider);
