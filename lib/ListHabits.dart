import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/AddHabit.dart';

import 'Storage.dart';
import 'domain/Habit.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({super.key});

  @override
  State<StatefulWidget> createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {

  void _showAddHabit() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return const AddHabit();
      }),
    ).then((_) => setState(() {}));
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
        onPressed: _showAddHabit,
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: Storage.habits.length,
      itemBuilder: (context, index) {
        return _card(Storage.habits, index);
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