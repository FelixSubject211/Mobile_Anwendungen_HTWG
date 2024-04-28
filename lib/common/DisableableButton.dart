import 'package:flutter/material.dart';

class DisableableButton extends StatelessWidget {
  final bool isButtonEnabled;
  final String text;
  final VoidCallback onPressed;

  const DisableableButton({
    super.key,
    required this.isButtonEnabled,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: isButtonEnabled ? onPressed : null,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          isButtonEnabled ? theme.primaryColor : theme.shadowColor,
        )
      ),
      child: Text(text),
    );
  }
}

