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

  // Toggle between editing and viewing mode
  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  // Navigate to the UpsertHabit screen to add or edit a habit
  void _showUpsertHabit(Habit? habit) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => UpsertHabit(habit: habit),
      ),
    );
  }

  // Mark habit as completed
  void _onCompleteHabit(Habit habit) {
    _habitRepository.completeHabit(habit);
  }

  // Mark habit as not completed
  void _onUnCompleteHabit(Habit habit) {
    _habitRepository.unCompleteHabit(habit);
  }

  // Handle reordering of habits
  void _onReorder(int oldIndex, int newIndex) {
    _habitRepository.reorderHabit(oldIndex, newIndex);
  }

  // Delete a habit
  void _onDeleteHabit(Habit habit) {
    _habitRepository.deleteHabit(habit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.listHabitsTitle.tr()),
        actions: <Widget>[
          yustoStreamBuilder(
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

  // Handle data received from the stream
  Widget _onData(BuildContext context, List<Habit> habits) {
    if (habits.isEmpty) {
      return _emptyState();
    } else {
      return _isEditing ? _buildEditableList(habits) : _buildList(habits);
    }
  }

  // Build the normal list of habits
  Widget _buildList(List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return _card(habits[index]);
      },
    );
  }

  // Build the editable list of habits
  Widget _buildEditableList(List<Habit> habits) {
    return ReorderableListView(
      onReorder: _onReorder,
      padding: const EdgeInsets.symmetric(vertical: 0),
      children: habits.map((habit) => _editableCard(habit)).toList(),
    );
  }

  // Build the card for each habit in the normal list
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

  // Build the card for each habit in the editable list
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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

  // Display empty state when there are no habits
  Widget _emptyState() {
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
}
