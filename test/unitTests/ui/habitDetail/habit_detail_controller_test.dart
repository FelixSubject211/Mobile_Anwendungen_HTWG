import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/domain/navigation/go_router_navigation_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/habit_repository.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_model.dart';
import 'package:mobile_anwendungen/ui/screens/habitDetail/habit_detail_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@GenerateMocks([HabitRepository, GoRouterNavigationService])
import 'habit_detail_controller_test.mocks.dart';

void main() {
  late MockHabitRepository mockHabitRepository;
  late MockGoRouterNavigationService mockGoRouterNavigationService;

  setUp(() {
    mockHabitRepository = MockHabitRepository();
    mockGoRouterNavigationService = MockGoRouterNavigationService();
  });

  group('HabitDetailDefaultController', () {
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
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
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
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
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
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
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
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(1));

      controller.onCancel();

      verify(mockGoRouterNavigationService.pop()).called(1);
    });

    test('onSave updates existing habit and calls pop', () {
      when(mockHabitRepository.getById(1)).thenReturn(habit);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(1));
      controller.onNameChanged('Updated Habit Name');
      controller.onSave();

      verify(mockHabitRepository.upsertHabit(habit)).called(1);
      verify(mockGoRouterNavigationService.pop()).called(1);
      expect(habit.name, 'Updated Habit Name');
    });

    test('onSave creates new habit and calls pop', () {
      when(mockHabitRepository.nextIndex()).thenReturn(0);

      final container = ProviderContainer(
        overrides: [
          habitRepositoryProvider.overrideWithValue(mockHabitRepository),
          goRouterNavigationServiceProvider
              .overrideWithValue(mockGoRouterNavigationService),
        ],
      );

      final controller = container.read(habitDetailControllerProvider(null));
      controller.onNameChanged('New Habit Name');
      controller.onSave();

      verify(mockHabitRepository.upsertHabit(any)).called(1);
      verify(mockGoRouterNavigationService.pop()).called(1);
    });
  });
}
