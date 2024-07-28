import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/domain/habit/model/day_state.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_model.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_provider.dart';
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
            loaded: (habits, isEditing) =>
                _editButton(habits, isEditing, controller),
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
        onPressed: () => controller.showHabitDetail(null, context),
        tooltip: LocaleKeys.habitsFloatingActionButtonTooltip.tr(),
        child: Icon(
          Icons.add,
          semanticLabel: LocaleKeys.habitsFloatingActionButtonTooltip.tr(),
        ),
      ),
    );
  }

  Widget _onData(
      List<Habit> habits, bool isEditing, WidgetRef ref, BuildContext context) {
    return habits.isEmpty
        ? _emptyState(context)
        : (isEditing
            ? _buildEditableList(habits, ref, context)
            : _buildList(habits, ref, context));
  }

  Widget _editButton(
      List<Habit> habits, bool isEditing, HabitsController controller) {
    return habits.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              icon: Icon(
                isEditing ? Icons.check : Icons.edit,
                semanticLabel:
                    isEditing ? LocaleKeys.finish.tr() : LocaleKeys.edit.tr(),
              ),
              onPressed: controller.toggleEditing,
              tooltip:
                  isEditing ? LocaleKeys.finish.tr() : LocaleKeys.edit.tr(),
            ),
          )
        : Container();
  }

  Widget _buildList(List<Habit> habits, WidgetRef ref, BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        final habit = habits[index];
        return _habit(habit, _habitCheckbox(habit, ref), ref, context);
      },
    );
  }

  Widget _buildEditableList(
      List<Habit> habits, WidgetRef ref, BuildContext context) {
    final controller = ref.read(habitsControllerProvider);

    return ReorderableListView(
      onReorder: controller.onReorder,
      proxyDecorator: (child, index, animation) => child,
      padding: const EdgeInsets.symmetric(vertical: 0),
      children: habits
          .map((habit) => _habit(
              habit, _habitEditActions(context, habit, ref), ref, context))
          .toList(),
    );
  }

  Material _habit(
      Habit habit, Widget trailing, WidgetRef ref, BuildContext context) {
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
            controller.showHabitDetail(habit.id, context);
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

  Row _habitEditActions(BuildContext context, Habit habit, WidgetRef ref) {
    final controller = ref.read(habitsControllerProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.delete_outline,
            semanticLabel: LocaleKeys.delete.tr(),
          ),
          onPressed: () {
            controller.showConfirmDeleteAlert(habit);
          },
        ),
        const Icon(Icons.drag_handle_sharp),
      ],
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
      ),
    );
  }
}

abstract class HabitsController {
  void showHabitDetail(int? id, BuildContext context);
  void onCompleteHabit(Habit habit);
  void onUnCompleteHabit(Habit habit);
  void onReorder(int oldIndex, int newIndex);
  void onDeleteHabit(Habit habit);
  void toggleEditing();
  void showConfirmDeleteAlert(Habit habit);
}
