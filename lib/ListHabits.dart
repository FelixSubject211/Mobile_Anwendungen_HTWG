import 'package:flutter/material.dart';

import 'Habit.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({super.key});

  @override
  State<StatefulWidget> createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {
  final List<Habit> _habits = [];

  void _action() {
    setState(() {
      Habit newHabit = Habit(id: 1, name: 'Neue Gewohnheit');
      _habits.add(newHabit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gewohnheiten"),
        centerTitle: true,
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _action,
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _habits.length,
      itemBuilder: (context, index) {
        return _card(_habits, index);
      }
    );
  }

  Widget _card(List<Habit> data, int index) {
    return Card(
      key: ValueKey(index),
      child: ListTile(
          title: Text(data[index].name),
          onTap: () {},
          trailing: const Text("")
      ),
    );
  }
}