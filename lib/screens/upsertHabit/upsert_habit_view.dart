import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/habits/habit.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_model.dart';
import 'package:mobile_anwendungen/screens/upsertHabit/upsert_habit_provider.dart';

import '../../lang/locale_keys.g.dart';

class UpsertHabit extends ConsumerWidget {
  final Habit? habit;

  const UpsertHabit({super.key, this.habit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UpsertHabitController controller =
        ref.read(upsertHabitControllerProvider(habit));
    final UpsertHabitModel model = ref.watch(upsertHabitModelProvider(habit));

    return Scaffold(
      appBar: AppBar(
          title: Text(
        model.isInEditMode
            ? LocaleKeys.upsertHabitEditTitle.tr()
            : LocaleKeys.upsertHabitAddTitle.tr(),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                child: _nameField(model, controller),
              ),
              const Divider(
                height: 20,
              ),
              _buttonRow(model, controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nameField(UpsertHabitModel model, UpsertHabitController controller) {
    return TextFormField(
        initialValue: model.name,
        onChanged: controller.onNameChanged,
        decoration: InputDecoration(
            labelText: LocaleKeys.upsertHabitNameLabelText.tr(),
            border: const OutlineInputBorder()));
  }

  Widget _buttonRow(UpsertHabitModel model, UpsertHabitController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            onPressed: controller.onCancel,
            child: Text(LocaleKeys.cancel.tr()),
          ),
        ),
        ElevatedButton(
          onPressed: model.name.isNotEmpty ? controller.onSave : null,
          child: Text(LocaleKeys.save.tr()),
        ),
      ],
    );
  }
}

abstract class UpsertHabitController {
  void onNameChanged(String name);
  void onSave();
  void onCancel();
}
