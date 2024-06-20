import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_provider.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

class HabitDetail extends StatelessWidget {
  final Habit? habit;

  const HabitDetail({super.key, this.habit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, _) {
            final model = ref.watch(habitDetailModelProvider(habit));
            return Text(
              model.isInEditMode
                  ? LocaleKeys.habitDetailEditTitle.tr()
                  : LocaleKeys.habitDetailAddTitle.tr(),
            );
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NameInputField(),
              Divider(height: 20),
              ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class NameInputField extends ConsumerWidget {
  const NameInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(habitDetailModelProvider(null));
    final controller = ref.read(habitDetailControllerProvider(null));

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: TextFormField(
        initialValue: model.name,
        onChanged: controller.onNameChanged,
        decoration: InputDecoration(
          labelText: LocaleKeys.habitDetailNameLabelText.tr(),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ActionButtons extends ConsumerWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(habitDetailModelProvider(null));
    final controller = ref.read(habitDetailControllerProvider(null));

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

abstract class HabitDetailController {
  void onNameChanged(String name);
  void onSave();
  void onCancel();
}
