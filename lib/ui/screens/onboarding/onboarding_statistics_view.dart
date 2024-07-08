import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/widgets/progress_button.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_statistics_provider.dart';

class OnboardingStatistics extends ConsumerWidget {
  const OnboardingStatistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnboardingStatisticsController controller =
        ref.read(onboardingStatisticsControllerProvider);

    return Scaffold(
      body: Material(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/onboardingStatistics.png'),
              const Padding(
                padding: EdgeInsets.only(top: 32.0, left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nützliche Statistiken',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Visualisieren Sie Ihren Fortschritt.',
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

abstract class OnboardingStatisticsController {
  void onNext(BuildContext context);
}
