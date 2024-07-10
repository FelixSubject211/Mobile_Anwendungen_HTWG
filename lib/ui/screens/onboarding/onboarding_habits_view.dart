import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/widgets/progress_button.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/onboarding_habits_provider.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 406,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/onboardingHabits.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 32.0, left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.onboardingHabitsTitle.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        LocaleKeys.onboardingHabitsSubtitle.tr(),
                        style: const TextStyle(fontSize: 12),
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
