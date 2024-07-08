import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_start_provider.dart';

class OnboardingStart extends ConsumerWidget {
  const OnboardingStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnboardingStartController controller =
        ref.read(onboardingStartControllerProvider);

    return Material(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color(0xff3E4ACA),
            Color(0xff9DCEFF),
          ],
        )),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 64.0),
                child: Column(
                  children: [
                    Text(
                      'Willkommen',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 4.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(64, 0, 0, 0),
                            ),
                          ]),
                    ),
                    Text(
                      'Zeit, gute Gewohnheiten zu entwickeln',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 4.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(64, 0, 0, 0),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.checklist,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 72.0,
                      semanticLabel: 'Yusto Logo',
                      shadows: [
                        Shadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(64, 0, 0, 0),
                        ),
                      ]),
                  Text(
                    'YUSTO',
                    style:
                        TextStyle(fontSize: 32, color: Colors.white, shadows: [
                      Shadow(
                        offset: Offset(0, 4.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(64, 0, 0, 0),
                      ),
                    ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 64.0),
                child: ElevatedButton(
                  onPressed: () => controller.onStart(context),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.indigo,
                      textStyle: const TextStyle(fontSize: 16),
                      fixedSize: const Size.fromWidth(128.0)),
                  child: const Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class OnboardingStartController {
  void onStart(BuildContext context);
}
