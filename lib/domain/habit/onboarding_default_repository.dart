import 'package:mobile_anwendungen/domain/habit/onboarding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/database/object_box_database.dart';

part 'onboarding_default_repository.g.dart';

@Riverpod(keepAlive: true)
OnboardingDefaultRepository onboardingRepository(
  final OnboardingRepositoryRef ref,
) =>
    OnboardingDefaultRepository(database: ref.watch(objectBoxDatabaseProvider));

class OnboardingDefaultRepository extends OnboardingRepository {
  final Database database;

  OnboardingDefaultRepository({
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
