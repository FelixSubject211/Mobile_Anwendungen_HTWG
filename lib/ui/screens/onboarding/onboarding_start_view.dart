import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/screens/onboarding/'
    'onboarding_controller_provider/onboarding_start_provider/'
    'onboarding_start_provider.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 64.0),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.onboardingStartTitle.tr(),
                      style: const TextStyle(
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
                      LocaleKeys.onboardingStartSubtitle.tr(),
                      style: const TextStyle(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.checklist,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      size: 72.0,
                      semanticLabel: LocaleKeys.yustoLogo.tr(),
                      shadows: const [
                        Shadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(64, 0, 0, 0),
                        ),
                      ]),
                  Text(
                    LocaleKeys.yusto.tr(),
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        shadows: [
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
                  child: Text(LocaleKeys.onboardingStartButton.tr()),
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
