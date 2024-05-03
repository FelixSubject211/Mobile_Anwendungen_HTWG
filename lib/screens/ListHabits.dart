import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/common/YustoStreamBuilder.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/screens/AddHabit.dart';

import '../domain/habits/Habit.dart';
import '../lang/locale_keys.g.dart';

class ListHabits extends StatefulWidget {
  const ListHabits({super.key});

  @override
  State<StatefulWidget> createState() => _ListHabitsState();
}

class _ListHabitsState extends State<ListHabits> {
  late final Stream<List<Habit>> _habits;

  @override
  void initState() {
    super.initState();
    _habits = GetIt.instance.get<HabitRepository>().listHabits();
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
        title: Text(LocaleKeys.listHabitsTitle.tr())
      ),
      body: yustoStreamBuilder(
          stream: _habits,
          onData: _buildList
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHabit,
        tooltip: LocaleKeys.listHabitsFloatingActionButtonTooltip.tr(),
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
