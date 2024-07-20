import 'package:easy_localization/easy_localization.dart';
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
  late MockHabitDefaultRepository mockHabitRepository;
  late ProviderContainer container;

  setUp(() {
    mockHabitRepository = MockHabitDefaultRepository();
    container = ProviderContainer(
      overrides: [
        habitRepositoryProvider.overrideWithValue(mockHabitRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('when onSegmentedControlPressed is called, state transitions to loading and then loaded', () async {
    final habits = [Habit(id: 1, name: 'Test Habit', index: 0, creationDate: DateTime.now(), completionDates: [])];

    // Stub the habits method to return the habits list
    when(mockHabitRepository.habits()).thenAnswer((_) => Stream.value(habits));


    final controller = container.read(statisticsControllerProvider);

    // Trigger the onSegmentedControlPressed method
    controller.onSegmentedControlPressed('Month');

    // Immediately check the state to be loading
    expect(
      container.read(statisticsModelProvider),
      equals(const StatisticsModel.loading()),
    );
  });
}
