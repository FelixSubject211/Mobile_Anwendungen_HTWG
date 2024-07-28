import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/ui/widgets/custom_timer_painter.dart';

class ProgressButton extends StatefulWidget {
  final VoidCallback onPressed;

  const ProgressButton({
    super.key,
    required this.onPressed,
  });

  @override
  ProgressButtonState createState() => ProgressButtonState();
}

class ProgressButtonState extends State<ProgressButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () => controller.value == 0.0 ? widget.onPressed() : null,
      child: Stack(
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: GestureDetector(
              child: CustomPaint(
                painter: CustomTimerPainter(
                  animation: controller,
                  backgroundColor: Colors.white,
                  color: theme.primaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            left: 12.0,
            top: 12.0,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Icon(
                  Icons.arrow_forward,
                  semanticLabel: LocaleKeys.progressButton.tr(),
                  color: controller.value == 0.0 ? Colors.indigo : Colors.grey,
                  size: 32,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
