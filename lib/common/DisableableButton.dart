import 'package:flutter/material.dart';

class DisableButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const DisableButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
          onPressed != null ? theme.primaryColor : theme.shadowColor,
        ),
      ),
      child: Text(text),
    );
  }
}
