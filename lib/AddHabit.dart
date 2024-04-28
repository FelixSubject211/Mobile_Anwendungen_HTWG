import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/Storage.dart';

import 'common/DisableableButton.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({super.key});

  @override
  State<StatefulWidget> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {

  String name = "";

  void onNameChanged(String name) {
    setState(() {
      this.name = name;
    });
  }

  void _save() {
    Storage.addHabit(name);
    Navigator.of(context).pop();
  }

  bool _isValid() {
    return name.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gewohnheiten Hinzufügen"),
        centerTitle: true,
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
        onNameChanged(text);
      },
      decoration: const InputDecoration(
        labelText: 'Name',
        filled: true,
      )
    );
  }

  Widget _saveButton() {
    return DisableableButton(
      isButtonEnabled: name.isNotEmpty,
      text: "Speichern",
      onPressed: _save
    );
  }
}