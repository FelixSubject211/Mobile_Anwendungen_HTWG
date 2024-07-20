import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_model.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_provider.dart';
import 'package:riverpod/riverpod.dart';

// Generiere die Mock-Klassen
@GenerateMocks([HabitRepository, GoRouter])
import 'habit_detail_controller_test.mocks.dart';

void main() {
  late MockHabitRepository mockHabitRepository;
  late MockGoRouter mockHabitDetailNavigationService;

  setUp(() {
    mockHabitRepository = MockHabitRepository();
    mockHabitDetailNavigationService = MockGoRouter();
  });

  group('HabitDetailDefaultController', ()
  {
    final habit = Habit(
      id: 1,
      name: 'Test Habit',
      index: 0,
      creationDate: DateTime.now(),
      completionDates: [],
    );

    test('initial state is loading', () {
      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final model = container.read(habitDetailModelProvider(null));

      expect(model, HabitDetailModel(isInEditMode: false, name: ''));
    });

    test('loaded state when habit is retrieved by ID', () {
      when(mockHabitRepository.getById(1)).thenReturn(habit);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final model = container.read(habitDetailModelProvider(1));

      expect(model, HabitDetailModel(isInEditMode: true, name: 'Test Habit'));
    });

    test('onNameChanged updates the state', () {
      when(mockHabitRepository.getById(1)).thenReturn(habit);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(1));

      controller.onNameChanged('Updated Habit Name');

      final model = container.read(habitDetailModelProvider(1));
      expect(model.name, 'Updated Habit Name');
    });

    test('onCancel calls navigation service pop', () {
      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(1));

      controller.onCancel();

      verify(mockHabitDetailNavigationService.pop()).called(1);
    });

    test('onSave updates existing habit and calls pop', () {
      when(mockHabitRepository.getById(1)).thenReturn(habit);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(1));
      controller.onNameChanged('Updated Habit Name');
      controller.onSave();

      verify(mockHabitRepository.upsertHabit(habit)).called(1);
      verify(mockHabitDetailNavigationService.pop()).called(1);
      expect(habit.name, 'Updated Habit Name');
    });

    test('onSave creates new habit and calls pop', () {
      when(mockHabitRepository.nextIndex()).thenReturn(0);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterProvider.overrideWithValue(mockHabitDetailNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(null));
      controller.onNameChanged('New Habit Name');
      controller.onSave();

      verify(mockHabitRepository.upsertHabit(any)).called(1);
      verify(mockHabitDetailNavigationService.pop()).called(1);
    });
  });
}
