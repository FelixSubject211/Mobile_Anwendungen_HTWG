import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/onboarding_service/onboarding_default_service.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mockito/annotations.dart';

import '../onboarding/onboarding_default_service_test.mocks.dart';

// Generiere Mocks für die Database-Klasse
@GenerateMocks([Database])
void main() {
  late MockDatabase mockDatabase;
  late OnboardingDefaultService onboardingService;

  setUp(() {
    // Initialisiere MockDatabase und OnboardingDefaultService
    mockDatabase = MockDatabase();
    onboardingService = OnboardingDefaultService(database: mockDatabase);
  });

  group('OnboardingDefaultService', () {
    test('should complete onboarding', () {
      // Act
      onboardingService.completeOnboarding();

      // Assert
      verify(mockDatabase.completeOnboarding()).called(1);
    });

    test('should return true if onboarding is completed', () {
      // Arrange
      when(mockDatabase.isCompletedOnboarding()).thenReturn(true);

      // Act
      final isCompleted = onboardingService.isCompletedOnboarding();

      // Assert
      expect(isCompleted, isTrue);
      verify(mockDatabase.isCompletedOnboarding()).called(1);
    });

    test('should return false if onboarding is not completed', () {
      // Arrange
      when(mockDatabase.isCompletedOnboarding()).thenReturn(false);

      // Act
      final isCompleted = onboardingService.isCompletedOnboarding();

      // Assert
      expect(isCompleted, isFalse);
      verify(mockDatabase.isCompletedOnboarding()).called(1);
    });
  });
}
