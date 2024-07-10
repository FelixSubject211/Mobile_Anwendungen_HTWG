import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/widgets/progress_button.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 445,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/onboardingStatistics.png',
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
                      LocaleKeys.onboardingStatisticsTitle.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        LocaleKeys.onboardingStatisticsSubtitle.tr(),
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

abstract class OnboardingStatisticsController {
  void onNext(BuildContext context);
}
