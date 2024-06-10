/*
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
      Habit habit = Habit(
          name: name,
          index: Habit.newIndex(),
          creationDate: DateTime.now().millisecondsSinceEpoch);

      _habitRepository.upsertHabit(habit);
    }
    context.pop();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                child: _nameField(),
              ),
              const Divider(
                height: 20,
              ),
              _buttonRow(),
            ],
          ),
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
            border: const OutlineInputBorder()));
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TextButton(
            onPressed: _onCancel,
            child: Text(LocaleKeys.cancel.tr()),
          ),
        ),
        ElevatedButton(
          onPressed: _isValid() ? _onSave : null,
          child: Text(LocaleKeys.save.tr()),
        ),
      ],
    );
  }
}
 */
