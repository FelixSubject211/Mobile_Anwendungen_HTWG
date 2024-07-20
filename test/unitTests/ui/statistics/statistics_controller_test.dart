import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_provider.dart';

import 'statistics_controller_test.mocks.dart';

@GenerateMocks([HabitRepository])
void main() {
  late MockHabitRepository mockHabitRepository;
  late ProviderContainer container;

  setUp(() {
    mockHabitRepository = MockHabitRepository();
    container = ProviderContainer(
      overrides: [
        habitRepositoryProvider.overrideWithValue(mockHabitRepository)
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('StatisticsDefaultController Tests', () {
    test('initial state should be loading', () {
      when(mockHabitRepository.habits()).thenAnswer((_) => Stream.value([]));
      final model = container.read(statisticsModelProvider);
      expect(model, equals(const StatisticsModel.loading()));
    });
  });
}