import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final String selectedButton;
  final Function(String) onButtonPressed;
  final ThemeData theme;

  const SelectionButton({super.key,
    required this.label,
    required this.selectedButton,
    required this.onButtonPressed,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedButton == label;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
        backgroundColor: isSelected ? theme.colorScheme.primary : theme.colorScheme.surface,
      ),
      onPressed: () => onButtonPressed(label),
      child: Text(label),
    );
  }
}