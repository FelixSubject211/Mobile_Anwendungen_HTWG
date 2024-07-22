import 'package:mobile_anwendungen/domain/onboarding_service/onboarding_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';

part 'onboarding_default_service.g.dart';

@Riverpod(keepAlive: true)
OnboardingDefaultService onboardingService(
  final OnboardingServiceRef ref,
) =>
    OnboardingDefaultService(database: ref.watch(objectBoxDatabaseProvider));

class OnboardingDefaultService extends OnboardingService {
  final Database database;

  OnboardingDefaultService({
    required this.database,
  }) : super();

  @override
  void completeOnboarding() {
    database.completeOnboarding();
  }

  @override
  bool isCompletedOnboarding() {
    return database.isCompletedOnboarding();
  }
}
