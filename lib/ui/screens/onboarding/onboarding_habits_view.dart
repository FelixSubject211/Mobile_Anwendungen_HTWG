import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/widgets/progress_button.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_provider.dart';

class OnboardingHabits extends ConsumerWidget {
  const OnboardingHabits({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnboardingHabitsController controller =
        ref.read(onboardingHabitsControllerProvider);

    return Scaffold(
      body: Material(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/onboardingHabits.png'),
              const Padding(
                padding: EdgeInsets.only(top: 32.0, left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verfolgen Sie ihre Ziele',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Erkunden Sie die App, finden Sie Ruhe, um gute Gewohnheiten zu erreichen',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
      floatingActionButton: ProgressButton(
        onPressed: () => controller.onNext(context),
      ),
    );
  }
}

abstract class OnboardingHabitsController {
  void onNext(BuildContext context);
}
