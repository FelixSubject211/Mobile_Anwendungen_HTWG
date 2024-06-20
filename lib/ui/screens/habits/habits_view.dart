import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/habit/model/day_state.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_providers.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

class Habits extends ConsumerWidget {
  const Habits({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HabitsController controller = ref.read(habitsControllerProvider);
    final HabitsModel model = ref.watch(habitsModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.habitsTitle.tr()),
        actions: [
          model.when(
            loading: () => Container(),
            loaded: (habits, isEditing) => _editButton(habits, isEditing, controller),
          ),
        ],
      ),
      body: model.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: (habits, isEditing) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _onData(habits, isEditing, ref, context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.showHabitDetail(null),
        tooltip: LocaleKeys.habitsFloatingActionButtonTooltip.tr(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _onData(List<Habit> habits, bool isEditing, WidgetRef ref, BuildContext context) {
    return habits.isEmpty
        ? _emptyState(context)
        : (isEditing ? _buildEditableList(habits, ref) : _buildList(habits, ref));
  }

  Widget _editButton(List<Habit> habits, bool isEditing, HabitsController controller) {
    return habits.isNotEmpty
        ? IconButton(
      icon: Icon(isEditing ? Icons.check : Icons.edit),
      onPressed: controller.toggleEditing,
      tooltip: isEditing ? LocaleKeys.finish.tr() : LocaleKeys.edit.tr(),
    )
        : Container();
  }

  Widget _buildList(List<Habit> habits, WidgetRef ref) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return _habit(habit, _habitCheckbox(habit, ref), ref);
      },
    );
  }

  Widget _buildEditableList(List<Habit> habits, WidgetRef ref) {
    final controller = ref.read(habitsControllerProvider);

    return ReorderableListView(
      onReorder: controller.onReorder,
      proxyDecorator: (child, index, animation) => child,
      padding: const EdgeInsets.symmetric(vertical: 0),
      children: habits
          .map((habit) => _habit(habit, _habitEditActions(habit, ref), ref))
          .toList(),
    );
  }

  Material _habit(Habit habit, Widget trailing, WidgetRef ref) {
    final controller = ref.read(habitsControllerProvider);

    return Material(
      color: Colors.transparent,
      key: ValueKey(habit.index),
      child: ListTile(
        title: Text(
          habit.name,
          style: habit.isCompletedToday() == DayState.done
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        trailing: trailing,
        onTap: () {
          if (ref.read(habitsModelProvider).maybeWhen(
            orElse: () => false,
            loaded: (_, isEditing) => isEditing,
          )) {
            controller.showHabitDetail(habit);
          }
        },
        enabled: ref.read(habitsModelProvider).maybeWhen(
          orElse: () => false,
          loaded: (_, isEditing) => isEditing,
        ) ||
            habit.isCompletedToday() != DayState.done,
        shape: const Border(bottom: BorderSide()),
      ),
    );
  }

  SizedBox _habitCheckbox(Habit habit, WidgetRef ref) {
    final controller = ref.read(habitsControllerProvider);

    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(
        visualDensity: VisualDensity.compact,
        value: habit.isCompletedToday() == DayState.done,
        onChanged: (isChecked) {
          if (isChecked ?? false) {
            controller.onCompleteHabit(habit);
          } else {
            controller.onUnCompleteHabit(habit);
          }
        },
      ),
    );
  }

  Row _habitEditActions(Habit habit, WidgetRef ref) {
    final controller = ref.read(habitsControllerProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => controller.onDeleteHabit(habit),
        ),
        const Icon(Icons.drag_handle_sharp),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/empty.png'),
          Text(
            LocaleKeys.textIfItIsEmpty.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

abstract class HabitsController {
  void showHabitDetail(Habit? habit);
  void onCompleteHabit(Habit habit);
  void onUnCompleteHabit(Habit habit);
  void onReorder(int oldIndex, int newIndex);
  void onDeleteHabit(Habit habit);
  void toggleEditing();
}
