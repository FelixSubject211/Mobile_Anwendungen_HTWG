import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/common/yusto_stream_builder.dart';
import 'package:mobile_anwendungen/domain/habits/day_state.dart';
import 'package:mobile_anwendungen/domain/habits/habit_repository.dart';
import 'package:mobile_anwendungen/screens/upsert_habit.dart';
import '../domain/habits/habit.dart';
import '../lang/locale_keys.g.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({super.key});

  @override
  State<StatefulWidget> createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {
  final HabitRepository _habitRepository =
      GetIt.instance.get<HabitRepository>();

  bool _isEditing = false;

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _showUpsertHabit(Habit? habit) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => UpsertHabit(habit: habit),
      ),
    );
  }

  void _onCompleteHabit(Habit habit) {
    _habitRepository.completeHabit(habit);
  }

  void _onUnCompleteHabit(Habit habit) {
    _habitRepository.unCompleteHabit(habit);
  }

  void _onReorder(int oldIndex, int newIndex) {
    _habitRepository.reorderHabit(oldIndex, newIndex);
  }

  void _onDeleteHabit(Habit habit) {
    _habitRepository.deleteHabit(habit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.listHabitsTitle.tr()),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: yustoStreamBuilder(
              stream: _habitRepository.listHabits(),
              onData: (context, habits) {
                if (habits.isNotEmpty) {
                  return IconButton(
                    icon: Icon(_isEditing ? Icons.check : Icons.edit),
                    onPressed: _toggleEditing,
                    tooltip: _isEditing
                        ? LocaleKeys.finish.tr()
                        : LocaleKeys.edit.tr(),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: yustoStreamBuilder(
            stream: _habitRepository.listHabits(),
            onData: _onData,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showUpsertHabit(null);
        },
        tooltip: LocaleKeys.listHabitsFloatingActionButtonTooltip.tr(),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _onData(BuildContext context, List<Habit> habits) {
    if (habits.isEmpty) {
      return _emptyState();
    } else {
      return _isEditing ? _buildEditableList(habits) : _buildList(habits);
    }
  }

  Widget _buildList(List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        Habit habit = habits[index];
        return _habit(habit, _habitCheckbox(habit), null);
      },
    );
  }

  Widget _buildEditableList(List<Habit> habits) {
    return ReorderableListView(
      onReorder: _onReorder,
      proxyDecorator: (child, index, animation) => child,
      padding: const EdgeInsets.symmetric(vertical: 0),
      children: habits
          .map((habit) => _habit(habit, _habitEditActions(habit), () {
                _showUpsertHabit(habit);
              }))
          .toList(),
    );
  }

  Material _habit(Habit habit, Widget trailing, void Function()? onTap) {
    return Material(
        color: Colors.transparent,
        key: ValueKey(habit.id),
        child: ListTile(
          title: Text(
            habit.name,
            style: habit.isCompletedToday() == DayState.done
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : null,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          trailing: trailing,
          onTap: onTap ??
              () {
                if (_isEditing) {
                  _showUpsertHabit(habit);
                }
              },
          enabled: _isEditing || habit.isCompletedToday() != DayState.done,
          shape: const Border(
            bottom: BorderSide(),
          ),
        ));
  }

  SizedBox _habitCheckbox(Habit habit) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(
        visualDensity: VisualDensity.compact,
        value: habit.isCompletedToday() == DayState.done,
        onChanged: (isChecked) {
          if (isChecked ?? false) {
            _onCompleteHabit(habit);
          } else {
            _onUnCompleteHabit(habit);
          }
        },
      ),
    );
  }

  Row _habitEditActions(Habit habit) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            _onDeleteHabit(habit);
          },
        ),
        const Icon(Icons.drag_handle_sharp)
      ],
    );
  }

  Widget _emptyState() {
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
