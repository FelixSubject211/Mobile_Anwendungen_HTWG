import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/common/YustoStreamBuilder.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/AddHabit.dart';

import '../domain/habits/Habit.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({Key? key}) : super(key: key);

  @override
  _ListHabitsState createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {
  late final Stream<List<Habit>> _habits;

  @override
  void initState() {
    super.initState();
    _habits = GetIt.instance.get<HabitRepository>().habits();
  }

  void _showAddHabit() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const AddHabit(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gewohnheiten"),
        centerTitle: true,
      ),
      body: yustoStreamBuilder(
          stream: _habits,
          onData: _buildList
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabit,
        tooltip: 'Action',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<Habit> habits) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (context, index) {
        return _card(habits[index]);
      },
    );
  }

  Widget _card(Habit habit) {
    return Card(
      child: ListTile(
        title: Text(habit.name),
        onTap: () {},
        trailing: const Text(''),
      ),
    );
  }
}
