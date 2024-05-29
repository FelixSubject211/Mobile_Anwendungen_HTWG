import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_anwendungen/domain/habits/Habit.dart';
import 'package:mobile_anwendungen/domain/habits/HabitRepository.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';

import '../common/DisableableButton.dart';

class UpsertHabit extends StatefulWidget {
  final Habit? habit;

  const UpsertHabit({super.key, this.habit});

  @override
  State<StatefulWidget> createState() => _UpsertHabitState();
}

class _UpsertHabitState extends State<UpsertHabit> {
  final HabitRepository _habitRepository =
      GetIt.instance.get<HabitRepository>();

  late String name;

  @override
  void initState() {
    super.initState();
    name = widget.habit?.name ?? "";
  }

  void _onNameChanged(String name) {
    setState(() {
      this.name = name;
    });
  }

  void _onSave() {
    if (widget.habit != null) {
      widget.habit?.name = name;
      _habitRepository.upsertHabit(widget.habit!);
    } else {
      _habitRepository.upsertHabit(Habit(
          name: name,
          index: Habit.newIndex(),
          creationDate: DateTime.now().millisecondsSinceEpoch));
    }
    Navigator.of(context).pop();
  }

  void _onCancel() {
    Navigator.of(context).pop();
  }

  bool _isValid() {
    return name.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.habit == null
            ? LocaleKeys.upsertHabitAddTitle.tr()
            : LocaleKeys.upsertHabitEditTitle.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _nameField(),
            const SizedBox(height: 20),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextFormField(
        initialValue: name,
        onChanged: (text) {
          _onNameChanged(text);
        },
        decoration: InputDecoration(
          labelText: LocaleKeys.upsertHabitNameLabelText.tr(),
          filled: true,
        ));
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _onCancel,
          child: Text(LocaleKeys.cancel.tr()),
        ),
        DisableButton(
          text: LocaleKeys.save.tr(),
          onPressed: _isValid() ? _onSave : null,
        ),
      ],
    );
  }
}
