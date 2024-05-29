import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/common/YustoStreamBuilder.dart';
import 'package:mobile_anwendungen/domain/habits/DayState.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/UpsertHabit.dart';
import '../domain/habits/Habit.dart';
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
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: _toggleEditing,
            tooltip: _isEditing ? LocaleKeys.finish.tr() : LocaleKeys.edit.tr(),
          ),
        ],
      ),
      body: yustoStreamBuilder(
        stream: _habitRepository.listHabits(),
        onData: _onData,
      ),
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty.png'),
            Text(
              LocaleKeys.textIfItIsEmpty.tr(),
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      );
    }
    return _isEditing ? _buildEditableList(habits) : _buildList(habits);
  }

  Widget _buildList(List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return _card(habits[index]);
      },
    );
  }

  Widget _buildEditableList(List<Habit> habits) {
    return ReorderableListView(
      onReorder: _onReorder,
      padding: const EdgeInsets.symmetric(vertical: 0), // Anpassung des Innenabstands
      children: habits.map((habit) => _editableCard(habit)).toList(),
    );
  }

  Widget _card(Habit habit) {
    return Container(
      key: ValueKey(habit.id),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        title: Text(habit.name),
        trailing: Checkbox(
          value: habit.isCompletedToday() == DayState.done,
          onChanged: (isChecked) {
            if (isChecked ?? false) {
              _onCompleteHabit(habit);
            } else {
              _onUnCompleteHabit(habit);
            }
          },
        ),
      ),
    );
  }

  Widget _editableCard(Habit habit) {
    return Container(
      key: ValueKey(habit.id),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0), // Anpassung des Innenabstands
        title: Text(habit.name),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _onDeleteHabit(habit);
              },
            ),
            const Icon(Icons.drag_handle),
          ],
        ),
        onTap: () {
          _showUpsertHabit(habit);
        },
      ),
    );
  }
}
