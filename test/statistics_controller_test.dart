import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_provider.dart';

import 'statistics_controller_test.mocks.dart';

@GenerateMocks([HabitDefaultRepository])
void main() {
  late MockHabitRepository mockHabitRepository;
  late ProviderContainer container;

  setUp(() {
    mockHabitRepository = MockHabitRepository();
    container = ProviderContainer(
      overrides: [
        habitRepositoryProvider.overrideWithValue(mockHabitRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('StatisticsDefaultController Tests', () {
    test('initial state should be loading', () {
      when(mockHabitRepository.habits()).thenAnswer((_) => Stream.value([]));
      final controller = container.read(statisticsControllerProvider.notifier);
      final state = controller.build(habitRepository: mockHabitRepository);
      expect(state, equals(const StatisticsModel.loading()));
    });

    test('should load habits and update state', () async {
      final habits = [Habit(id: 1, name: 'Test Habit', index: 0, creationDate: DateTime.now(), completionDates: [])];
      when(mockHabitRepository.habits()).thenAnswer((_) => Stream.value(habits));

      final controller = container.read(statisticsControllerProvider.notifier);
      controller.build(habitRepository: mockHabitRepository);

      await Future.delayed(Duration.zero); // Ensure the async code executes
      verify(mockHabitRepository.habits()).called(1);
      expect(
        container.read(statisticsModelProvider),
        equals(
          StatisticsModel.loaded(
            selectedButton: 'Week',
            habits: habits,
          ),
        ),
      );
    });

    test('should update state when onSegmentedControlPressed is called', () async {
      final habits = [Habit(id: 1, name: 'Test Habit', index: 0, creationDate: DateTime.now(), completionDates: [])];
      final controller = container.read(statisticsControllerProvider.notifier);

      controller.state = StatisticsModel.loaded(
        selectedButton: 'Week',
        habits: habits,
      );

      controller.onSegmentedControlPressed('Month');

      expect(
        container.read(statisticsModelProvider),
        equals(
          StatisticsModel.loaded(
            selectedButton: 'Month',
            habits: habits,
          ),
        ),
      );
    });
  });
}
