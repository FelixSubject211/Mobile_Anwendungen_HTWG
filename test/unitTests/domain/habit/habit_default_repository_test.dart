import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mobile_anwendungen/domain/habit/model/habit.dart';
import 'package:mobile_anwendungen/domain/habit/habit_default_repository.dart';
import 'package:mobile_anwendungen/database/model/database_habit.dart';
import 'package:mobile_anwendungen/database/database.dart';
import 'package:mobile_anwendungen/common/completion_date.dart';
import 'package:mockito/annotations.dart';

import 'habit_default_repository_test.mocks.dart';

@GenerateMocks([Database])
void main() {
  late MockDatabase mockDatabase;
  late HabitDefaultRepository repository;

  setUp(() {
    mockDatabase = MockDatabase();
    repository = HabitDefaultRepository(database: mockDatabase);
  });

  group('HabitDefaultRepository', () {
    bool habitEqualsIgnoringCreationDate(Habit habit1, Habit habit2) {
      return habit1.id == habit2.id &&
          habit1.name == habit2.name &&
          habit1.index == habit2.index;
    }

    Future<bool> containsHabitInStream(
        Stream<List<Habit>> stream, Habit habit) async {
      await for (var habitList in stream) {
        if (habitList.any((h) => habitEqualsIgnoringCreationDate(h, habit))) {
          return true;
        }
      }
      return false;
    }

    test('should stream updated habits when upsertHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();

      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      final dbHabit = DatabaseHabit(
          id: habit.id,
          name: habit.name,
          index: habit.index,
          creationDate: habit.creationDate.millisecondsSinceEpoch);

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.upsertHabit(habit);

      // Assert
      final containsHabit =
          await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.upsertHabit(any)).called(1);
    });

    test('should stream updated habits when completeHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();
      final completionDate = DateTime.now();

      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [CompletionDate(id: 1, dateTime: completionDate)],
      );

      final dbHabit = DatabaseHabit(
          id: habit.id,
          name: habit.name,
          index: habit.index,
          creationDate: habit.creationDate.millisecondsSinceEpoch);

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.completeHabit(habit);

      // Assert
      final containsHabit =
          await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.completeHabit(any)).called(1);
    });

    test('should stream updated habits when unCompleteHabit is called',
        () async {
      // Arrange
      final creationDate = DateTime.now();
      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      final dbHabit = DatabaseHabit(
          id: habit.id,
          name: habit.name,
          index: habit.index,
          creationDate: habit.creationDate.millisecondsSinceEpoch);

      when(mockDatabase.listHabits()).thenReturn([dbHabit]);

      // Act
      repository.unCompleteHabit(habit);

      // Assert
      final containsHabit =
          await containsHabitInStream(repository.habits(), habit);

      expect(containsHabit, isTrue);

      verify(mockDatabase.unCompleteHabit(any)).called(1);
    });

    test('should stream updated habits when deleteHabit is called', () async {
      // Arrange
      final creationDate = DateTime.now();
      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: creationDate,
        completionDates: [],
      );

      when(mockDatabase.listHabits()).thenReturn([]);

      // Act
      repository.deleteHabit(habit);

      // Assert
      await repository.habits().first.then((habitList) {
        expect(habitList, []);
      });

      verify(mockDatabase.deleteHabit(any)).called(1);
    });

    test('should reorder habits', () async {
      // Arrange
      final habit1 = Habit(
        id: 1,
        name: 'Test Habit 1',
        index: 0,
        creationDate: DateTime.now(),
        completionDates: [],
      );
      final habit2 = Habit(
        id: 2,
        name: 'Test Habit 2',
        index: 1,
        creationDate: DateTime.now(),
        completionDates: [],
      );

      final dbHabits = [
        DatabaseHabit(
            id: habit1.id,
            name: habit1.name,
            index: habit1.index,
            creationDate: habit1.creationDate.millisecondsSinceEpoch),
        DatabaseHabit(
            id: habit2.id,
            name: habit2.name,
            index: habit2.index,
            creationDate: habit2.creationDate.millisecondsSinceEpoch),
      ];

      when(mockDatabase.listHabits()).thenReturn(dbHabits);

      // Act
      repository.reorderHabit(0, 1);

      // Assert
      verify(mockDatabase.reorderHabit(0, 1)).called(1);
    });

    test('should return next index', () async {
      // Arrange
      when(mockDatabase.nextIndex()).thenReturn(1);

      // Act
      final index = repository.nextIndex();

      // Assert
      expect(index, 1);
      verify(mockDatabase.nextIndex()).called(1);
    });

    test('should get habit by id', () async {
      // Arrange
      final habit = Habit(
        id: 1,
        name: 'Test Habit',
        index: 0,
        creationDate: DateTime.now(),
        completionDates: [],
      );

      final dbHabit = DatabaseHabit(
          id: habit.id,
          name: habit.name,
          index: habit.index,
          creationDate: habit.creationDate.millisecondsSinceEpoch);

      when(mockDatabase.getById(habit.id)).thenReturn(dbHabit);

      // Act
      final fetchedHabit = repository.getById(habit.id);

      // Assert
      expect(fetchedHabit, isNotNull);
      expect(habitEqualsIgnoringCreationDate(fetchedHabit!, habit), isTrue);
      verify(mockDatabase.getById(habit.id)).called(1);
    });
  });
}
