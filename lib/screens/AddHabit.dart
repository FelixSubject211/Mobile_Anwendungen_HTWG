import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

import '../common/DisableableButton.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({super.key});

  @override
  State<StatefulWidget> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {

  String name = "";

  void _onNameChanged(String name) {
    setState(() {
      this.name = name;
    });
  }

  void _onSave() {
    GetIt.instance.get<HabitRepository>().addHabit(Habit(
        name: name,
        index: Habit.newIndex()
    ));
    Navigator.of(context).pop();
  }

  bool _isValid() {
    return name.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.addHabitTitle.tr())
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _nameField(),
            const SizedBox(height: 20),
            _saveButton(),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextField(
      onChanged: (text) {
        _onNameChanged(text);
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.addHabitNameLabelText.tr(),
        filled: true,
      )
    );
  }

  Widget _saveButton() {
    return DisableableButton(
      isButtonEnabled: _isValid(),
      text: LocaleKeys.save.tr(),
      onPressed: _onSave
    );
  }
}